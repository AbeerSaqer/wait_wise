import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/core/widgets/buttons.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User granted permission");
    }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(
          "Title : ${message.notification?.title} | body : ${message.notification?.body}");
    });
  }

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  void displayDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.notifications_on_outlined),
                  Expanded(
                    child: Text(
                        """Allow "WaitWise" to send notification on your mobile ? """),
                  ),
                ],
              ),
              actions: [
                CupertinoDialogAction(
                    onPressed: () {},
                    child: TextButton(
                        onPressed: () async {
                          FirebaseMessaging.instance.getToken().then((token) {
                            print("My token  : $token");
                          });
                          Navigator.pushReplacementNamed(context, '/home_screen');
                        },
                        child: Text("Allow"))),
                CupertinoDialogAction(
                    onPressed: () {},
                    child: TextButton(
                        onPressed: () => Navigator.pushReplacementNamed(
                            context, '/qr_code_screen'),
                        child: Text(" Don't Allow"))),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A237E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/appointment_screen'),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 110,
            top: 10,
            child: Text(
              "Appoitment Details ",
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
            ),
          ),
          Positioned(
              left: 0,
              top: 175,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50)),
                    width: 390,
                    height: 600,
                    child: Padding(
                      padding: EdgeInsets.all(60.0),
                      child: Column(
                        children: [
                          Center(
                              child: QrImageView(
                                data: 'Appointment serial number',
                                version: QrVersions.auto,
                                size: 200.0,
                              ),),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "When you go to the branch, scan the QR code using QR reader.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Take a screenshot of your QR code.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Positioned(
              left: 155,
              top: 115,
              child: Center(
                  child: Text(
                " 0015",
                style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ))),
          Positioned(
              bottom: 40,
              left: 125,
              child: ButtonWidget(
                  title: "Confirm",
                  onPressed: displayDialog,
                  width: 140,
                  height: 40,
                  color: Colors.blue))
        ],
      ),
    );
  }
}
