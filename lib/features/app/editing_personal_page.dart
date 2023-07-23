import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/core/widgets/buttons.dart';
import 'package:grad_project/core/widgets/text_field.dart';

import 'main_page.dart';
import 'profile_page.dart';
import 'service_page.dart';

class EditingProfile extends StatefulWidget {
  const EditingProfile({Key? key}) : super(key: key);

  @override
  State<EditingProfile> createState() => _EditingProfileState();
}

late TextEditingController _nameEditingController;
late TextEditingController _idEditingController;
late TextEditingController _phoneEditingController;
late TextEditingController _emailEditingController;
late TextEditingController _passwordEditingController;
late TextEditingController _addressEditingController;

class _EditingProfileState extends State<EditingProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameEditingController = TextEditingController();
    _idEditingController = TextEditingController();
    _phoneEditingController = TextEditingController();
    _emailEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
    _addressEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _nameEditingController.dispose();
    _idEditingController.dispose();
    _phoneEditingController.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    _addressEditingController.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;

  final _widgetOptions = [
    MainScreen(),
    ServiceScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/profile_screen'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Profile ",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'images/profile_drower.png',
                  width: 100,
                  height: 100,
                ),
                Text(
                  "Personal information",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    height: 3,
                  ),
                ),
                Image.asset(
                  'images/id.png',
                ),
                SizedBox(
                  height: 20.5,
                ),
                TextFieldWidget(
                  obscureText: false,
                  title: "Full Name",
                  controller: _nameEditingController,
                  icon_name: Icons.person,
                ),
                TextFieldWidget(
                  obscureText: false,
                  title: " ID",
                  controller: _idEditingController,
                  icon_name: Icons.credit_card,
                ),
                TextFieldWidget(
                  obscureText: false,
                  title: "Email ",
                  controller: _emailEditingController,
                  icon_name: Icons.email,
                ),
                TextFieldWidget(
                  obscureText: false,
                  title: "Phone Number",
                  controller: _phoneEditingController,
                  icon_name: Icons.phone,
                ),
                TextFieldWidget(
                  obscureText: false,
                  title: "Address",
                  controller: _addressEditingController,
                  icon_name: Icons.location_on,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonWidget(
                        title: "cancel",
                        onPressed: () => Navigator.pushReplacementNamed(
                            context, '/profile_screen'),
                        width: 142,
                        height: 40,
                        color: Colors.grey),
                    ButtonWidget(
                      title: "save",
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, '/profile_screen'),
                      width: 142,
                      height: 40,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
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
