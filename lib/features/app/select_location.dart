import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/core/widgets/buttons.dart';
import 'package:grad_project/core/widgets/text_field.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

late TextEditingController startLocation;
late TextEditingController destinationLocation;

class _SelectLocationState extends State<SelectLocation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startLocation = TextEditingController();
    destinationLocation = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    startLocation.dispose();
    destinationLocation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: Text(
          "Selcet Location",
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 350,
                  height: 270,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFieldWidget(
                              obscureText: false,
                              title: "Started Location ",
                              controller: startLocation,
                              icon_name: Icons.location_on),
                          SizedBox(
                            height: 10,
                          ),
                          TextFieldWidget(
                              obscureText: false,
                              title: "Destination Location ",
                              controller: destinationLocation,
                              icon_name: Icons.location_on),
                          ButtonWidget(
                              title: "Get the Route",
                              onPressed: () {},
                              width: 200,
                              height: 40,
                              color: Colors.lightBlue)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: Image.asset("images/location.png"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 120,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                            ),
                            Text("15.5 KM "),
                          ],
                        ),
                        Text("Destance")
                      ],
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                            ),
                            Text("15 Minutes"),
                          ],
                        ),
                        Text("Estimated Time")
                      ],
                    ),
                  ),
                ],
              ),
              ButtonWidget(
                  title: "Save",
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, '/appointment_screen'),
                  width: 120,
                  height: 40,
                  color: Colors.blueAccent),
            ],
          ),
        ),
      ),
    );
  }
}
