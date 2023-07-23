
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.title, required this.onPressed, required this.width, required this.height, required this.color,}) : super(key: key);
final String title;
final VoidCallback  onPressed;
final double width;
final double height;
final Color color;



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      child: Text(
        title,
        style: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
elevation: 0,
        minimumSize: Size(width,height ),
        primary: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20,),),
      ),
    );
  }
}
