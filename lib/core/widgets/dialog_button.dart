import 'package:flutter/material.dart';
import 'package:grad_project/core/widgets/main_button.dart';

import '../resoursess/manager_colors.dart';
import '../resoursess/manager_fonts.dart';
import '../resoursess/manager_sizes.dart';
import '../resoursess/manager_styles.dart';

Widget dialogButton({
  void Function()? onPressed,
  required String message,
}) {
  return mainButton(
    child: Text(
      message,
      style: getMediumTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.white,
      ),
    ),
    onPressed: onPressed,
    color: ManagerColors.primaryColor,
    height: ManagerHeight.h40,
  );
}
