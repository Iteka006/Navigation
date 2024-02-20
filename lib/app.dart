import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'drawer.dart';
import 'home_screen.dart';
import 'calculator_screen.dart';
import 'about_screen.dart';

class ThemePreference {
  static const String key = "theme";

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  Future<void> setTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, isDark);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ThemePreference().getTheme(),
      builder: (context, snapshot) {
        bool isDarkMode = snapshot.data ?? false;
        return MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: MyHomePage(),
        );
      },
    );
  }
}



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      drawer: MyDrawer(onItemTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        Navigator.pop(context);
      }),
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _toggleTheme();
        },
        tooltip: 'Toggle Theme',
        child: Icon(Icons.brightness_6),
      ),
    );
  }

  Widget _getBody() {
    switch (_selectedIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return CalculatorScreen();
      case 2:
        return NewsScreen();
      default:
        return Container();
    }
  }

 void _toggleTheme() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int currentThemeIndex = prefs.getInt(ThemePreference.key) ?? 0;
  int nextThemeIndex = (currentThemeIndex + 1) % 3; // Assuming you have 3 themes

  prefs.setInt(ThemePreference.key, nextThemeIndex);

  setState(() {
    // Rebuild the widget tree to reflect the theme change
  });
}

}
