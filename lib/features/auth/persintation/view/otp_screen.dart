import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/core/resoursess/manager_colors.dart';
import 'package:grad_project/core/resoursess/manager_strings.dart';
import 'package:grad_project/core/widgets/main_button.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ManagerStrings.verificationCode,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
            Image.asset('images/code.png', scale: 1.4),
            Text(
              ManagerStrings.verifyMessage.toUpperCase(),
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
            const SizedBox(height: 40.0),
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.center,
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code) => print("OTP is => $code"),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: mainButton(
                onPressed: () => Get.offAllNamed('/login_screen'),
                color: ManagerColors.black,
                padding: EdgeInsetsDirectional.all(10),
                height: 10,
                elevation: 2,
                minWidth: 100,
                shapeBorder: RoundedRectangleBorder(),
                child: Text(
                  ManagerStrings.next,
                  style: TextStyle(color: ManagerColors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
