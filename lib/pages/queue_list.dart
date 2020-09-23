import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartq/blocs/org_bloc.dart';
import 'package:smartq/pages/org_info.dart';
import 'package:smartq/styles.dart' as style;

class QueueList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orgBloc = BlocProvider.of<OrgBloc>(context);
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: orgBloc.state.organisations.length,
        itemBuilder: (context, index) {
          var item = orgBloc.state.organisations[index];
          var addr1 = orgBloc.state.organisations[index].address1;
          var addr2 = orgBloc.state.organisations[index].address2;
          var negeri = orgBloc.state.organisations[index].state;
          var remCount =
              (int.parse(item.maxOut) - int.parse(item.queNo)).toString();

          return InkWell(
            onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (ctx) => OrgInfoPage(
                  id: item.id,
                  remCount: remCount,
                ),
              ),
            ),
            child: Container(
              // dense: false,
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(
                              color: style.primaryColor,
                              fontWeight: FontWeight.w700),
                        ),
                        Text("$addr1,$addr2,$negeri"),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      // width: 150,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: MyBox(
                                  title: "Total",
                                  count: item.queNo,
                                  color: style.primaryColor,
                                ),
                              ),
                              Flexible(
                                child: MyBox(
                                  title: "Current",
                                  count: item.currentNo,
                                  color: style.darkBlueColor,
                                ),
                              )
                            ],
                          ),
                          MyBox(
                            title: "Remaining",
                            count: remCount,
                            color: style.orangeColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyBox extends StatelessWidget {
  final title;
  final count;
  final color;

  MyBox({this.title, this.count, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      // height: 50,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        // borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            count,
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.w700, color: Colors.white),
          )
        ],
      ),
    );
  }
}
