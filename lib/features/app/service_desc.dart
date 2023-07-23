import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/core/widgets/buttons.dart';

class ServiceDescription extends StatefulWidget {
  const ServiceDescription({Key? key}) : super(key: key);

  @override
  State<ServiceDescription> createState() => _ServiceDescriptionState();
}

int _selectedIndex = 0;

class _ServiceDescriptionState extends State<ServiceDescription> {
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
              Navigator.pushReplacementNamed(context, '/service_screen'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Description of service: ",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 550,
            decoration: BoxDecoration(
              color: Color(0xFF9ABDFC),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name of service :",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 2,
                            )),
                        Text(
                          'Customer service ',
                          style: GoogleFonts.poppins(fontSize: 20, height: 2),
                        ),
                        Text(
                          "Description:",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 2),
                        ),
                        Text(
                          """Customer service includes actions such as providing product suggestion, troubleshooting problem and complaints""",
                          style: GoogleFonts.poppins(fontSize: 20, height: 2),
                        ),
                        Text(
                          "ID of service :",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 2),
                        ),
                        Text(
                          "001",
                          style: GoogleFonts.poppins(fontSize: 20, height: 2),
                        ),
                        Text(
                          "Name of Employee :",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 2),
                        ),
                        Text(
                          "Shatha Nadir",
                          style: GoogleFonts.poppins(fontSize: 20, height: 2),
                        ),
                      ],
                    ),
                  ),
                  ButtonWidget(
                      title: "Book now ",
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, '/booking_service_screen'),
                      width: 120,
                      height: 40,
                      color: Colors.white24)
                ],
              ),
            ),
          )
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
