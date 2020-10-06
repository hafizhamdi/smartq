import 'package:flutter/material.dart';
import 'package:smartq/pages/detail/detailscreen.dart';
import 'package:smartq/pages/homepage/component/itemlist.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
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
            )
          ],
        ),
      ),
    );
  }
}
