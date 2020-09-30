import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatefulWidget {
  _SplashPage createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 7));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan[400],
        body: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(
                    "assets/images/logo.jpeg",
                  ),
                  // width: 500,
                  // height: 500,
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Text(
                  "Queue system make your waiting easy, Wait anywhere you like!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),SizedBox(
            height: 30.0,
          ),
          SpinKitDualRing(
            color: Colors.cyan[50],
          ),
                // )
              ],
            ),
          ),
        ),
      ),
      // ),
      // ),
    );
  }
}
