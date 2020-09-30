import 'package:flutter/material.dart';
import 'package:smartq/pages/detailscreen.dart';

class ItemList extends StatelessWidget {
  final hospitalname, address, distance;
  final Function ontap;
  ItemList(this.hospitalname, this.address, this.distance, this.ontap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 15.0, bottom: 15.0, left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                hospitalname,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              Row(
                children: [
                  Text(
                    address.substring(0, 30),
                    style: TextStyle(fontSize: 17, color: Colors.grey.shade600),
                  ),
                  Text(
                    "...",
                    style: TextStyle(fontSize: 17, color: Colors.grey.shade600),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Text(
                distance + "km",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(hospitalname)),
        );
      },
    );
  }
}
