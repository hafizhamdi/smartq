import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartq/pages/sign_in/sign_in_screen.dart';

class CustomDrawer extends Drawer {
  @override
  Widget build(BuildContext context) => new Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: new Text(
                "Lee Min Ho bin Lee Dong Wook".toUpperCase(),
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                  color: Colors.black,
                ),
              ),
              accountEmail: new Text(
                "leeminho@gmail.com",
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.cyan,
                  backgroundImage:
                      Image.asset('assets/images/avatar.png').image),
              decoration: BoxDecoration(
                color: Colors.cyan[400],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.hourglass_empty,
                color: Colors.blueAccent,
              ),
              title: Text(
                "MyQueue",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // Navigator.push(context,
                //     CupertinoPageRoute(builder: (ctx) => Department()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About Us"),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sign Out"),
              onTap: () {
                showAlertDialog(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sign In"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignInScreen()));
              },
            ),
          ],
        ),
      );

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Proceed"),
      onPressed: () {
        //   Navigator.of(context).pushAndRemoveUntil(
        //       new MaterialPageRoute(
        //           builder: (BuildContext context) => LogMasuk()),
        //       (Route<dynamic> route) => false);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Are you sure to log out?"),
      content: Text("Click Proceed to log out!"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
