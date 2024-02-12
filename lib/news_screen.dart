import 'package:flutter/material.dart';
import 'drawer.dart'; 

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      drawer: MyDrawer(
        onItemTap: (index) {
          handleNavigation(index, context);
        },
      ),
      body: Center(
        child: Text('News Screen Content'),
      ),
    );
  }

  void handleNavigation(int index, BuildContext context) {
    // Handle navigation based on the selected index
    switch (index) {
      case 0:
        Navigator.pop(context); // Close the drawer
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pop(context); // Close the drawer
        Navigator.pushNamed(context, '/about');
        break;
      case 2:
        Navigator.pop(context); // Close the drawer
        Navigator.pushNamed(context, '/calculator');
        break;
      case 3:
        // Stay on the current screen (NewsScreen)
        break;
      case 4:
        Navigator.pop(context); // Close the drawer
        Navigator.pushNamed(context, '/settings');
        break;
    }
  }
}