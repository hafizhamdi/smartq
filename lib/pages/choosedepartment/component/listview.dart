import 'package:flutter/material.dart';
import 'package:smartq/components/custom_surfix_icon.dart';

class ListDepartment extends StatelessWidget {
  final departmentname, icon;
  final Function ontap;
  ListDepartment(this.departmentname, this.icon, this.ontap);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading:
          
          //  Icon(icon),
           CustomSurffixIcon(svgIcon: icon,),

          title: Text(departmentname),
          trailing: Icon(Icons.arrow_forward),
          onTap: () => ontap(),
        ),
      ),
    );
  }
}
