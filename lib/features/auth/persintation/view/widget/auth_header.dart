import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class authHeader extends StatelessWidget {
  const authHeader({
    required this.tilte,
    super.key,
  });
  final String tilte;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            tilte,
            style: GoogleFonts.aBeeZee(
                color: const Color(0xFFEA5C5C), fontSize: 30),
          ),
        ),
        Stack(
          children: [
            Image.asset(
              'images/bg_auth.png',
              scale: 1,
            ),
            Image.asset(
              'images/pic_auth.png',
              scale: 1,
            ),
          ],
        ),
      ],
    );
  }
}
