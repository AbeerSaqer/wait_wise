// import 'package:flutter/material.dart';
// import 'package:grad_project/screens/app/home_page.dart';
// import 'package:grad_project/screens/app/profile_page.dart';
// import 'package:grad_project/screens/app/service_page.dart';
//
// class BottomNavigatorWidget extends StatefulWidget {
//   const BottomNavigatorWidget({Key? key}) : super(key: key);
//
//   @override
//   State<BottomNavigatorWidget> createState() => _BottomNavigatorWidgetState();
// }
//
// class _BottomNavigatorWidgetState extends State<BottomNavigatorWidget> {
//   int _selectedIndex = 0;
//
//   final _widgetOptions = [
//     Text("1"),
//     Text("2"),
//     Text("3"),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         BottomNavigationBar(
//           elevation: 0,
//           items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.business),
//           label: 'Service',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person),
//           label: 'Personal',
//         ),
//           ],
//           currentIndex: _selectedIndex,
//           selectedItemColor: Colors.amber[800],
//           onTap: (index) {
//         setState(() {
//           _selectedIndex = index;
//         });
//           },
//         ),
//       ],
//     );
//   }
// }
