import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartq/pages/choosedepartment/choosedepartmentpage.dart';
import 'package:smartq/pages/drawer.dart';
import 'package:smartq/pages/homepage/component/body.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SmartQ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black)),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.room),
              onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Department()),
                    )
                  })
        ],
      ),
      drawer: CustomDrawer(),
      body: Body(),
    );
  }
}
