import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartq/pages/choosedepartment/component/listview.dart';
import 'package:smartq/pages/pages.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: ListView(
        children: [
          ListDepartment(
            "O & G",
            "assets/icons/pregnant.svg",
            () => Navigator.of(context).push(CupertinoPageRoute(
                builder: (BuildContext context) => HomePage())),
          ),
          ListDepartment(
            "Dermatologi",
            "assets/icons/tooth.svg",
            () => Navigator.of(context).push(CupertinoPageRoute(
                builder: (BuildContext context) => HomePage())),
          ),
          ListDepartment(
            "Farmasi & Bekalan",
            "assets/icons/drug.svg",
            () => Navigator.of(context).push(CupertinoPageRoute(
                builder: (BuildContext context) => HomePage())),
          ),
          ListDepartment(
            "Kanak-kanak",
            "assets/icons/baby.svg",
            () => Navigator.of(context).push(CupertinoPageRoute(
                builder: (BuildContext context) => HomePage())),
          ),
        ],
      ),
    );
  }
}
