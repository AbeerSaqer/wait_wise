import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/core/resoursess/manager_colors.dart';
import 'package:grad_project/core/resoursess/manager_strings.dart';
import 'package:grad_project/core/widgets/main_button.dart';
import 'package:grad_project/features/auth/persintation/view/otp_screen.dart';

class ForgetPasswordPhoneScreen extends StatelessWidget {
  const ForgetPasswordPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'images/forget_pass.png',
                        scale: 5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ManagerStrings.resetPhone,
                        style: GoogleFonts.aBeeZee(
                            color: const Color(0xFFEA5C5C), fontSize: 30),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text(ManagerStrings.phone,
                                style: TextStyle(color: Color(0xFFEA5C5C))),
                            hintText: ManagerStrings.phone,
                            prefixIcon: Icon(
                              Icons.phone_android_outlined,
                              color: Color(0xFFEA5C5C),
                            )),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        child: mainButton(
                          onPressed: () => Get.off(OTPScreen()),
                          color: Color(0xFFEA5C5C),
                          padding: EdgeInsetsDirectional.all(10),
                          height: 10,
                          elevation: 2,
                          minWidth: 100,
                          shapeBorder: RoundedRectangleBorder(),
                          child: Text(
                            ManagerStrings.next,
                            style: TextStyle(
                                color: ManagerColors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
