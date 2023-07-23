import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/core/widgets/buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();
  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}


class BookingService extends StatefulWidget {
  const BookingService({Key? key}) : super(key: key);

  @override
  State<BookingService> createState() => _BookingServiceState();
}

int _selectedIndex = 0;

class _BookingServiceState extends State<BookingService> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay _time = TimeOfDay(hour: 9, minute: 00);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xff7b66c6),
              onPrimary: Color(0xffffffff),
              onSurface: Color(0x9A000000),
            ),
          ),
          child: child!),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
          "Booking Service ",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  """  Please 
  Schedule  your
  service""",
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
                Image.asset("images/woman_booking.png")
              ],
            ),
          ),
          Container(
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
                  Text(
                    "Schedule",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF3D5BB),
                    ),
                    onPressed: _selectTime,
                    child: Text(
                      'SELECT TIME',
                      style: GoogleFonts.poppins(color: Colors.black54),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 200,
                    height: 20,
                    child: Center(
                      child: Text(
                        'Selected time: ${_time.format(context)}',
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(
                          height: 8.0,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFF3D5BB),
                          ),
                          onPressed: () => _selectDate(context),
                          child: Text(
                            'SELECT DATE ',
                            style: GoogleFonts.poppins(color: Colors.black54),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 100,
                            height: 20,
                            child: Center(
                                child: Text("${selectedDate.toLocal()}"
                                    .split(' ')[0]))),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  ButtonWidget(
                      title: "Select location",
                      onPressed: () => MapUtils.openMap(31.44463727098125, 34.39411405481131),
                      // Navigator.pushReplacementNamed(context, '/location_map'),
                      width: 180,
                      height: 50,
                      color: Colors.blueAccent),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonWidget(
                      title: "Save",
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/appointment_screen'),
                      width: 220,
                      height: 40,
                      color: Colors.blueAccent),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
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

