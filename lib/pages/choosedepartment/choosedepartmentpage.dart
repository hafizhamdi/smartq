import 'package:flutter/material.dart';
import 'package:smartq/pages/choosedepartment/component/body.dart';

class Department extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Choose Department"),
        ),
        body: Body());
  }
}
