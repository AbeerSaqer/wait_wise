import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_project/core/resoursess/manager_sizes.dart';
import 'package:grad_project/core/resoursess/manager_strings.dart';
import 'package:grad_project/features/auth/persintation/view/widget/forger_password_mail.dart';
import 'package:grad_project/features/auth/persintation/view/widget/forger_password_phone.dart';
import 'package:grad_project/features/auth/persintation/view/widget/forget_password_options/forget_password_button_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(ManagerStrings.makeSelection,
                  style: TextStyle(fontSize: ManagerIconSize.s28)),
            ),
            const SizedBox(height: 20.0),
            Text(ManagerStrings.selectionOption,
                style: TextStyle(fontSize: ManagerIconSize.s22)),
            const SizedBox(height: 30.0),
            ForgetPasswordBtnWidget(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPasswordMailScreen());
              },
              title: ManagerStrings.email,
              subTitle: ManagerStrings.resend,
              btnIcon: Icons.mail_outline_rounded,
            ),
            const SizedBox(height: 20.0),
            ForgetPasswordBtnWidget(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPasswordPhoneScreen());
              },
              title: ManagerStrings.phone,
              subTitle: ManagerStrings.phone,
              btnIcon: Icons.mobile_friendly_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
