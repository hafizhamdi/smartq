import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartq/pages/detailscreen.dart';
import 'package:smartq/pages/itemlist.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.room), onPressed: () => {})
        ],
      ),
      drawer: drawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black38.withAlpha(10),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Find Hospital...",
                          hintStyle: TextStyle(
                            color: Colors.black.withAlpha(120),
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: (String keyword) {},
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.black.withAlpha(120),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ItemList(
                        "Hospital Kuala Lumpur",
                        "23, Jalan Pahang, 50586 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur",
                        "2.5",
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => DetailScreen(
                              "Hospital Kuala Lumpur",
                            ),
                          ),
                        ),
                      ),
                      ItemList(
                        "Hospital Serdang",
                        "Jalan Puchong, 43000 Kajang, Selangor",
                        "12.5",
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => DetailScreen("Hospital Serdang"),
                          ),
                        ),
                      ),
                      ItemList(
                        "Hospital Kajang",
                        "4, Jalan Semenyih, Bandar Kajang, 43000 Kajang, Selangor",
                        "20.5",
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => DetailScreen("Hospital Kajang"),
                          ),
                        ),
                      ),
                      ItemList(
                        "Hospital Selayang",
                        "B21, Lebuhraya Selayang - Kepong, 68100 Batu Caves, Selangor",
                        "14.5",
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => DetailScreen("Hospital Selayang"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // searchdetail(),
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   label: Text('Locate Me'),
      //   icon: Icon(Icons.location_searching),
      //   backgroundColor: Colors.cyan[400],
      //   foregroundColor: Colors.white,
      //   tooltip: 'Upload',
      //   onPressed: (){},
      // ),
    );
  }

  Widget drawer() {
    return Drawer(
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
                backgroundImage: Image.asset('assets/images/avatar.png').image),
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
            onTap: () {},
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
          ListTile(leading: Icon(Icons.info), title: Text("About Us")),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Sign Out"),
            onTap: () {},
          ),
        ],
      ),
    );
  }

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
