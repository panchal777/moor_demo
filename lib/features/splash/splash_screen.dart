import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moor_demo/main.dart';

import '../users/work_manager_demo.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => globalNavigatorKey.currentState?.popAndPushNamed('/home'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}
