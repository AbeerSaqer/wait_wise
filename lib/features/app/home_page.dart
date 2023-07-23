import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/features/app/main_page.dart';
import 'package:grad_project/features/app/profile_page.dart';
import 'package:grad_project/features/app/selected_branch.dart';
import 'package:grad_project/firebase/fb_auth_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final _widgetOptions = [
    const MainScreen(),
    const BranchScreen(),
    const ProfileScreen(),
  ];

  void displayDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.logout),
                  Expanded(
                    child: Text("""Are you sure you want to logout? """),
                  ),
                ],
              ),
              actions: [
                CupertinoDialogAction(
                    onPressed: () {},
                    child: TextButton(
                        onPressed: () async {
                          await FbAuthController().signOut();
                          Navigator.pushReplacementNamed(
                              context, '/login_screen');
                        },
                        child: Text("Yes"))),
                CupertinoDialogAction(
                    onPressed: () {},
                    child: TextButton(
                        onPressed: () => Navigator.pushReplacementNamed(
                            context, '/home_screen'),
                        child: Text("No"))),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.lightBlueAccent,
        child: Container(
          decoration: const BoxDecoration(
              gradient:
                  const LinearGradient(colors: [Colors.pink, Colors.blue])),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                // decoration: BoxDecoration(
                //  gradient: LinearGradient(colors: [Colors.pink,Colors.blue])
                // ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset("images/profile_drower.png",
                          width: 80, height: 80),
                      const Text(
                        'Shatha Nadir ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      const Text(
                        'Shathaaboyo18@gmail.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Divider(
                          height: 5, thickness: 2, color: Colors.white),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: TextButton(
                    child: const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          'Profile',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, '/profile_screen')),
              ),
              ListTile(
                leading: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                title: TextButton(
                    child: const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          'Notification',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, '/profile_screen')),
              ),
              ListTile(
                leading: const Icon(
                  Icons.select_all_rounded,
                  color: Colors.white,
                ),
                title: TextButton(
                    child: const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: const Text(
                          'Service',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        )),
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, '/service_screen')),
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: TextButton(
                    child: const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: const Text(
                          'Setting',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        )),
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, '/profile_screen')),
              ),
              ListTile(
                leading: const Icon(
                  Icons.account_balance_outlined,
                  color: Colors.white,
                ),
                title: TextButton(
                    child: const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: const Text(
                          'About',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, '/about_screen')),
              ),
              ListTile(
                leading: const Icon(
                  Icons.help_outline,
                  color: Colors.white,
                ),
                title: TextButton(
                    child: const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: const Text(
                          'Help',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        )),
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, '/profile_screen')),
              ),
              ListTile(
                leading: const Icon(
                  Icons.lock_outline,
                  color: Colors.white,
                ),
                title: TextButton(
                    child: const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: const Text(
                          'Password',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        )),
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, '/profile_screen')),
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ),
                title: TextButton(
                  child: const Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'Log out',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                  onPressed: () => displayDialog(),
                ),
              ),
            ],
          ),
        ),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Service',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Personal',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
