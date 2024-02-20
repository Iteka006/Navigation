import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';

import 'app.dart';

void main() {
  runApp(MyApp());
}
void checkInternetConnection() async {
  InternetConnectionStatus status = await InternetConnectionChecker().connectionStatus;

  if (status == InternetConnectionStatus.disconnected) {
    Fluttertoast.showToast(
      msg: "No internet connection",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
