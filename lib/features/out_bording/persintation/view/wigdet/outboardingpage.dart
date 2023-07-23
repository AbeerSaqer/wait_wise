import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutBoardingPage extends StatelessWidget {
  const OutBoardingPage({
    Key? key, required this.image, required this.title,
  }) : super(key: key);
final String image;
final String title ;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Image.asset(
            'images/$image.png',
          ),
        ),
        Column(
          children: [
            Center(
              child: Text(
                title,
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF16B6B),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}