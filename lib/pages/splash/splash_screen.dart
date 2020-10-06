import 'package:flutter/material.dart';
import 'package:smartq/pages/splash/component/body.dart';

class SplashPage extends StatefulWidget {
  _SplashPage createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Body();
  }
}
