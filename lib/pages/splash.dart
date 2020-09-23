import 'package:flutter/material.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff005d2d),
        body: Center(
          child: Container(
            width: 300,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/images/imi_logo.png"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Queue system make your waiting easy, Wait anywhere you like!",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  // )
                ]),
          ),
        ),
      ),
      // ),
      // ),
    );
  }
}
