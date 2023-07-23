import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/core/extensions/extensions.dart';
import 'package:grad_project/core/resoursess/manager_strings.dart';
import 'package:grad_project/core/utils/helpers.dart';
import 'package:grad_project/core/widgets/buttons.dart';
import 'package:grad_project/core/widgets/text_field.dart';
import 'package:grad_project/features/auth/persintation/view/widget/auth_header.dart';
import 'package:grad_project/features/auth/persintation/view/widget/forget_password_options/bulid_bottonSheet.dart';
import 'package:grad_project/firebase/fb_auth_controller.dart';
import 'package:grad_project/routes/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

late TextEditingController _emailController;

late TextEditingController _passwordController;

class _LoginScreenState extends State<LoginScreen> with Helpers {
  void displayDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Icon(Icons.location_on),
            Expanded(
              child: Text(
                """Allow "WaitWise" to access your location while you use the app ? """,
              ),
            ),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              _performLogin(); // Call the _performLogin() function
            },
            child: const Text("Allow"),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text(" Don't Allow"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  double? _progressValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                LinearProgressIndicator(
                  value: _progressValue,
                  backgroundColor: Colors.transparent,
                ),
                authHeader(tilte: ManagerStrings.dontHaveAccountHeader),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  child: Column(
                    children: [
                      TextFieldWidget(
                        obscureText: false,
                        title: 'Email',
                        controller: _emailController,
                        icon_name: Icons.email,
                      ),
                      TextFieldWidget(
                        obscureText: true,
                        title: 'Password',
                        controller: _passwordController,
                        icon_name: Icons.lock_outline,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                ForgetPasswordScreen.buildShowModalBottomSheet(
                                    context);
                              },
                              child: const Text(
                                "Forget password ?",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ButtonWidget(
                        title: "LOG IN",
                        onPressed: () {
                          displayDialog(context);
                          _checkData();
                        },
                        color: Colors.deepOrange,
                        width: 217,
                        height: 41,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "New user ? ",
                          ),
                          TextButton(
                            onPressed: () => Navigator.pushReplacementNamed(
                                context, '/register_screen'),
                            child: const Text(
                              "Register now ",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                        ],
                      )
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

  void _performLogin() {
    if (_checkData()) {
      _login();
    }
  }

  bool _checkData() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message: 'Enter required data!', erorr: true);
    return false;
  }

  void _login() async {
    _changeProgressValue(value: null);
    showDialog(context: context, builder: (context) => Container());
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    bool status = await FbAuthController().signIn(
      context: context,
      email: email,
      password: password,
    );

    _changeProgressValue(value: status ? 1 : 0);

    if (status) {
      showSnackBar(context: context, message: 'Login Successfully');
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, Routes.homeScreen);
    } else {
      Navigator.pop(context);
    }
  }

  void _changeProgressValue({required double? value}) {
    setState(() {
      _progressValue = value;
    });
  }
}
