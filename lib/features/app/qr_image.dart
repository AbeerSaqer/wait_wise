import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/core/widgets/buttons.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatefulWidget {
  const QrCode({Key? key}) : super(key: key);

  @override
  State<QrCode> createState() => _QrCodeState();

}

class _QrCodeState extends State<QrCode> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
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
              "Appointment Details ",
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
                    " 0017",
                    style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ))),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Service',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Personal',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
