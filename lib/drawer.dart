// my_drawer.dart
import 'package:flutter/material.dart';
// import 'package:tabnavigationbar/about_screen.dart';
import 'package:tabnavigationbar/settings_screen.dart';
import 'package:tabnavigationbar/signin_screen.dart';
import 'package:tabnavigationbar/signup_screen.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';


class MyDrawer extends StatelessWidget {
  final Function(int) onItemTap;

  MyDrawer({required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              onItemTap(0);
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: Text('Calculator'),
            onTap: () {
              onItemTap(1);
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              onItemTap(2);
            },
          ),
          ListTile(
            leading: Icon(Icons.new_releases),
            title: Text('News'),
            onTap: () {
              // Navigator.pop(context); // Close the drawer
              // Navigator.push(context, MaterialPageRoute(builder: (context) => NewsScreen()));
            },
          ),
           ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
          ),
          // In MyDrawer widget
ListTile(
  leading: Icon(Icons.account_circle),
  title: Text('Sign Up'),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  },
),
ListTile(
  leading: Icon(Icons.login),
  title: Text('Sign In'),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  },
),

        ],
      ),
    );
  }
}
