import 'package:flutter/material.dart';
import 'package:grad_project/core/resoursess/manager_styles.dart';

import 'manager_colors.dart';
import 'manager_fonts.dart';

class ManagerTextThemeDark extends TextTheme {
  @override
  TextStyle get displayMedium => getMediumTextStyle(
        fontSize: ManagerFontSize.s20,
        color: ManagerColors.textColorDark,
      );

  @override
  TextStyle get displaySmall => getBoldTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.textColorDark,
      );

  @override
  TextStyle get headlineMedium => getMediumTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.textColorDark,
      );

  @override
  TextStyle get titleMedium => getMediumTextStyle(
        fontSize: ManagerFontSize.s14,
        color: ManagerColors.textColorDark,
      );

  @override
  TextStyle get bodyLarge => getRegularTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.textColorDark,
      );
}
