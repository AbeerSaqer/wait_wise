import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/core/widgets/buttons.dart';
import 'package:grad_project/routes/routes.dart';

class BranchScreen extends StatefulWidget {
  const BranchScreen({Key? key}) : super(key: key);

  @override
  State<BranchScreen> createState() => _BranchScreenState();
}

class _BranchScreenState extends State<BranchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/home_screen'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Select Branch ",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        children: [
          InkWell(
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.branchScreen),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsetsDirectional.only(
                  top: 50, start: 30, end: 30, bottom: 50),
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("images/bank.png"),
                        Text(
                          'Al-Remal Branch',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Center(
                        child: Text(
                      'Al-Remal Street',
                      style: GoogleFonts.poppins(fontSize: 15, height: 2.5),
                    )),
                    Center(
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.blueGrey,
                                  Colors.blue,
                                  //add more colors
                                ]),
                                borderRadius: BorderRadius.circular(35),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.5), //shadow for button
                                      blurRadius: 5) //blur radius of shadow
                                ]),
                            child: ButtonWidget(
                                title: "Select",
                                onPressed: () => Navigator.pushReplacementNamed(
                                    context, '/service_screen'),
                                width: 150,
                                height: 40,
                                color: Colors.transparent))),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.branchScreen),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsetsDirectional.only(
                  top: 50, start: 30, end: 30, bottom: 50),
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset("images/bank.png"),
                        Text(
                          'Al-Nusairat Branch',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Center(
                        child: Text(
                      ' Entrance to Nuseirat camp',
                      style: GoogleFonts.poppins(fontSize: 15, height: 2.5),
                    )),
                    Center(
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.blueGrey,
                                  Colors.blue,
                                  //add more colors
                                ]),
                                borderRadius: BorderRadius.circular(35),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.5), //shadow for button
                                      blurRadius: 5) //blur radius of shadow
                                ]),
                            child: ButtonWidget(
                                title: "Select",
                                onPressed: () => Navigator.pushReplacementNamed(
                                    context, '/service_screen'),
                                width: 150,
                                height: 40,
                                color: Colors.transparent))),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.branchScreen),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsetsDirectional.only(
                  top: 50, start: 30, end: 30, bottom: 50),
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("images/bank.png"),
                        Text(
                          'Deir-Al-Balah Branch',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          ' Salah Al-Din Al-Ayoubi Street, Deir Al-Balah',
                          style: GoogleFonts.poppins(fontSize: 15, height: 2),
                        )),
                    Center(
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.blueGrey,
                                  Colors.blue,
                                  //add more colors
                                ]),
                                borderRadius: BorderRadius.circular(35),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.5), //shadow for button
                                      blurRadius: 5) //blur radius of shadow
                                ]),
                            child: ButtonWidget(
                                title: "Select",
                                onPressed: () => Navigator.pushReplacementNamed(
                                    context, '/service_screen'),
                                width: 150,
                                height: 40,
                                color: Colors.transparent))),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
