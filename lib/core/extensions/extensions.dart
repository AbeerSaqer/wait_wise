import 'package:flutter/material.dart';

extension NonNullString on String? {
  String onNull() {
    if (this == null) {
      return '';
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double onNull() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension NonNullBoolean on bool? {
  bool onNull() {
    if (this == null) {
      return false;
    } else {
      return this!;
    }
  }
}

extension NonNullFunction on void Function()? {
  void Function() onNull() {
    if (this == null) {
      return () {};
    } else {
      return this!;
    }
  }
}

extension NonNullFunctionBool on bool Function()? {
  bool Function() onNull() {
    if (this == null) {
      return () {
        return false;
      };
    } else {
      return this!;
    }
  }
}

extension NonNullInt on int? {
  int onNull() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension NonNullColor on Color? {
  Color onNull() {
    if (this == null) {
      return Colors.transparent;
    } else {
      return this!;
    }
  }
}

extension ContextExtension on BuildContext {
  void showSnackBar({
    required String message,
    bool erorr: false,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: erorr ? Colors.red.shade800 : Colors.blue.shade500,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
// AppLocalizations get localizations => AppLocalizations.of(this)!;
}
