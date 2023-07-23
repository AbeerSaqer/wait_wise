import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_project/features/lunch/persintation/controller/lunch_controller.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LunchController>(
        init: LunchController(),
        builder: (controller) => Center(
          child: Image.asset('images/lunch_pic.png'),
        ),
      ),
    );
  }
}
