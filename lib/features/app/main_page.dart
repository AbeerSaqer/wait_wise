import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentStep = 0;
  List<Step> _steps = [
    Step(
      title: Text(
        'Account service',
      ),
      content: Text('Counter - A Est. Time : 15 min'),
      isActive: true,
    ),
    Step(
      title: Text('Money transfers'),
      content: Text('Counter - B Est. Time : 25 min'),
      isActive: false,
    ),
    Step(
      title: Text('Credit Card'),
      content: Text('Counter - C Est. Time : 10min'),
      isActive: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset("images/profile_drower.png"),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello",
                  style:
                      GoogleFonts.poppins(color: Colors.black54, fontSize: 18),
                ),
                Text(
                  "Abeer Saqer",
                  style:
                      GoogleFonts.poppins(color: Colors.black54, fontSize: 18),
                ),
              ],
            ),
          ),
          actions: [
            InkWell(onTap: () {}, child: Image.asset("images/notification.png"))
          ],
          bottom: TabBar(
            indicatorColor: Colors.blueAccent,
            labelColor: Colors.blueAccent,
            tabs: [
              Tab(
                text: 'Executed appointment',
              ),
              Tab(text: 'Pending appointments'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Contents of Tab 1
            Theme(
              data: ThemeData(
                primarySwatch:
                    Colors.blue, // Set the primary swatch color to orange
                //ccentColor: Colors.blueAccent,
                textTheme: Theme.of(context).textTheme.copyWith(
                      button: TextStyle(color: Colors.white),
                      // Set the accent color to orange
                    ),
              ),
              child: Stepper(
                currentStep: _currentStep,
                onStepContinue: () {
                  setState(() {
                    if (_currentStep < _steps.length - 1) {
                      _currentStep++;
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (_currentStep > 0) {
                      _currentStep--;
                    }
                  });
                },
                steps: _steps,
              ),
            ),

            // Contents of Tab 2
            Center(child: Text('Pending appointments')),
          ],
        ),
      ),
    );
  }
}
