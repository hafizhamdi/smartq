import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smartq/styles.dart' as style;

class DetailScreen extends StatefulWidget {
  final String hospitalname;
  DetailScreen(this.hospitalname);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hospitalname),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.autorenew),
            onPressed: () => {},
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () => {},
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.0),
                    Card(
                      color: style.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              'Current Queue ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              '1004',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 60,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Card(
                      color: Colors.orange[400],
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              'Estimate Queue ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              '1006',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 60,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Card(
                      color: Colors.green[400],
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              'Queue Available ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              '12',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 60,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
                RaisedButton(
                  color: Colors.cyan[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Book Now',
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  onPressed: () {
                    successalert();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  successalert() {
    return Alert(
      context: context,
      //type: AlertType.success,
      image: Image.asset("assets/images/success.png"),
      title: "SUCCESS",
      desc: "Please be punctual. Thank You",
      content: Column(children: <Widget>[
        SizedBox(height: 30.0),
        Card(
          color: Colors.cyan[400],
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  'Your Queue Number  ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '1005',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ]),
      buttons: [
        DialogButton(
          color: Colors.grey[400],
          child: Text(
            "Close",
            style: TextStyle(color: Colors.black87, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }
}
