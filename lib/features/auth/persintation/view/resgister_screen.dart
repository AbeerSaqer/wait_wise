import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/core/extensions/extensions.dart';
import 'package:grad_project/core/resoursess/manager_strings.dart';
import 'package:grad_project/core/utils/helpers.dart';
import 'package:grad_project/core/widgets/buttons.dart';
import 'package:grad_project/core/widgets/text_field.dart';
import 'package:grad_project/features/auth/persintation/view/widget/auth_header.dart';
import 'package:grad_project/firebase/fb_auth_controller.dart';
import 'package:grad_project/routes/routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

late TextEditingController _emailController;

late TextEditingController _passwordController;

late TextEditingController _nameController;

late TextEditingController _idController;

late TextEditingController _phoneNumberController;

class _RegisterScreenState extends State<RegisterScreen> with Helpers {
  void displayDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.location_on),
                  Expanded(
                    child: Text(
                        """Allow "WaitWise" to access your location while you use the app ? """),
                  ),
                ],
              ),
              actions: [
                CupertinoDialogAction(
                    onPressed: () {},
                    child: TextButton(
                        onPressed: () => _performRegister(),
                        child: const Text(" Allow"))),
                CupertinoDialogAction(
                    onPressed: () {},
                    child: TextButton(
                        onPressed: () {}, child: const Text("Don't Allow"))),
              ],
            ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _idController = TextEditingController();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _idController.dispose();
    _phoneNumberController.dispose();
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
                authHeader(tilte: ManagerStrings.haveAccountHeader),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  child: Column(
                    children: [
                      TextFieldWidget(
                        obscureText: false,
                        title: 'Full name',
                        controller: _nameController,
                        icon_name: Icons.person,
                      ),
                      TextFieldWidget(
                        obscureText: false,
                        title: 'ID Number',
                        controller: _idController,
                        icon_name: Icons.card_travel,
                      ),
                      TextFieldWidget(
                        obscureText: false,
                        title: 'Phone Number',
                        controller: _phoneNumberController,
                        icon_name: Icons.phone,
                      ),
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
                        icon_name: Icons.password,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ButtonWidget(
                        title: "SIGN IN",
                        onPressed: () => _performRegister(),
                        width: 217,
                        height: 41,
                        color: Colors.deepOrange,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account ? ",
                    ),
                    TextButton(
                        onPressed: () => Navigator.pushReplacementNamed(
                            context, '/login_screen'),
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black45),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _performRegister() {
    if (_checkData()) {
      _register();
    }
  }

  bool _checkData() {
    if (_emailController.text.isNotEmpty &&
        _nameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message: 'Enter required data!', erorr: true);
    return false;
  }

  void _register() async {
    _changeProgressValue(value: null);
    showDialog(context: context, builder: (context) => Container());

    final email = _emailController.text.trim();
    final password = _passwordController.text;
    bool status = await FbAuthController().register(
      context: context,
      email: email,
      password: password,
    );
    _changeProgressValue(value: status ? 1 : 0);
    print(status);
    if (status) {
      showSnackBar(context: context, message: 'sign up successfully');
      Navigator.pushReplacementNamed(context, Routes.loginScreen);
    } else {
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, Routes.loginScreen);
    }
  }

  void _showSnackBar(String message, bool error) {
    context.showSnackBar(
      message: message,
      erorr: error,
    );
  }

  void _changeProgressValue({required double? value}) {
    setState(() {
      _progressValue = value;
    });
  }
}
