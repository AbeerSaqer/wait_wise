
import 'package:flutter/material.dart';

class AppBarWidgett extends StatefulWidget {
  const AppBarWidgett({Key? key, required this.title}) : super(key: key);

  @override
  State<AppBarWidgett> createState() => _AppBarWidgetState();
  final String title;
}

class _AppBarWidgetState extends State<AppBarWidgett> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black54,),
        onPressed: ()=> Navigator.pushReplacementNamed(context, '/home_screen'),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title:  Text(widget.title ,style: TextStyle(color: Colors.black54),),
    );
  }
}
