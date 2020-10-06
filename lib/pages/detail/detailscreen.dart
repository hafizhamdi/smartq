import 'package:flutter/material.dart';
import 'package:smartq/pages/detail/component/body.dart';


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
      body: Body(),
    );
  }
}
