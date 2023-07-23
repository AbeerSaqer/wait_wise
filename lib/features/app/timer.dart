import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/core/widgets/buttons.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> with TickerProviderStateMixin {
  late AnimationController controller;

  bool isPlaying = true;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  void notify() {
    if (countText == '00') {
      FlutterRingtonePlayer.playNotification();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(minutes: 20),
    );

    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = true;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Image.asset("images/img.png", width: 80, height: 80),
          SizedBox(
            height: 20,
          ),
          Text('Appointment Reminder',
              style: GoogleFonts.poppins(fontSize: 20)),
          Text("You have an appointment after",
              style: GoogleFonts.poppins(fontSize: 20)),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 270,
                  height: 270,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey.shade300,
                    color: Color(0xffbd5876),
                    value: progress,
                    strokeWidth: 12,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isDismissed) {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: 250,
                          child: CupertinoTimerPicker(
                            initialTimerDuration: controller.duration!,
                            onTimerDurationChanged: (time) {
                              setState(() {
                                controller.duration = time;
                                isPlaying = true;
                              });
                            },
                          ),
                        ),
                      );
                    }
                  },
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) => Text(
                      countText,
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text('Minute', style: GoogleFonts.poppins(fontSize: 30)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    ButtonWidget(
                      title: "Snooz",
                      onPressed: () {
                        displayDialog(context);
                      },
                      color: Color(0xffbd5876),
                      width: 250,
                      height: 70,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ButtonWidget(
                      title: "Done",
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home_screen');
                      },
                      color: Color(0xff8498ff),
                      width: 250,
                      height: 70,
                    ),
                  ],
                )
              ],
            ),
          ),
          // Padding(
          // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        ],
      ),
    );
  }

  void displayDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Icon(Icons.timer),
            Expanded(
              child: Text(
                """ Do You Want To Delay ? """,
              ),
            ),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("10 minutes more"),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text(" 20 minutes more"),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text(" 30 minutes more "),
          ),
        ],
      ),
    );
  }
}
