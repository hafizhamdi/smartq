import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartq/blocs/info_bloc.dart';
import 'package:smartq/model/organisation_info.dart';
import 'package:smartq/styles.dart' as style;

const IMAGE_URL = "https://smartq-server.heitecharena.com/smartq/images/";

class OrgInfoPage extends StatefulWidget {
  final id;
  final remCount;

  OrgInfoPage({this.id, this.remCount});
  _OrgInfo createState() => _OrgInfo();
}

class _OrgInfo extends State<OrgInfoPage> {
  var org;
  var remCount;
  OrgInfoBloc infoBloc;

  void initState() {
    // org = widget.org;
    // remCount = widget.remCount;

    infoBloc = BlocProvider.of<OrgInfoBloc>(context);
    infoBloc.add(FetchingInfo(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INFORMATION"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: BlocBuilder<OrgInfoBloc, InfoState>(
            cubit: infoBloc,
            builder: (context, state) {
              if (state is LoadedInfo) {
                var addr1 = infoBloc.state.orgInfo.address1;
                var addr2 = infoBloc.state.orgInfo.address2;
                var state = infoBloc.state.orgInfo.state;
                var ref = infoBloc.state.orgInfo.refCode;

                return Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        // padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0, 0.2),
                              )
                            ],
                            // border: Border.all(),
                            shape: BoxShape.rectangle),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text(
                                infoBloc.state.orgInfo.name,
                                style: TextStyle(
                                    color: style.primaryColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text("$addr1,$addr2,$state"),
                            ),
                            Container(
                              width: double.infinity,
                              // height: 200,
                              child: Image.network("$IMAGE_URL/$ref" + "1.jpg"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FlatButton.icon(
                                    label: Text("GET MAP"),
                                    icon: Icon(
                                      Icons.pin_drop,
                                      color: style.primaryColor,
                                    ),
                                    onPressed: () {},
                                  ),
                                  FlatButton.icon(
                                    label: Text("GET DETAIL"),
                                    icon: Icon(
                                      Icons.info,
                                      color: style.primaryColor,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: style.orangeColor,
                            shape: BoxShape.rectangle),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Remaining",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(widget.remCount,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: style.primaryColor,
                            shape: BoxShape.rectangle),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text("Total",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                Text(infoBloc.state.orgInfo.queNo,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Current",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                Text(infoBloc.state.orgInfo.currentNo,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Estimate",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                Text(infoBloc.state.orgInfo.estimate,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: style.primaryColor,
                            shape: BoxShape.rectangle),
                        child: Center(
                          child: Text(
                            "GET MY NUMBER",
                            style: TextStyle(fontSize: 23, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
              return Container(
                padding: EdgeInsets.all(10),
                width: 150,
                height: 150,
                child: CircularProgressIndicator(),
                // ),
                // ),
              );
            },
          ),
        ),
      ),
    );
  }
}
