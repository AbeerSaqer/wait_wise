import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black54,),
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/home_screen'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const  Text("About Us " ,style: TextStyle(color: Colors.black54),),
      ),
      body: Column(

        children: [
SizedBox(height: 50,),
          Text("""    A WaitWise app allows customers 
    to schedule appoitments anytime
    they wants.
""",style: GoogleFonts.poppins(fontSize: 20),),
          Image.asset("images/business.png"),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(""" The biggest advantages for customer is to find the nearest location or any other place they want and check the services. """,style: GoogleFonts.poppins(fontSize: 20)),
          )
        ],
      ),
    );
  }
}
