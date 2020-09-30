import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartq/blocs/info_bloc.dart';
import 'package:smartq/pages/pages.dart';

import 'blocs/org_bloc.dart';
import 'styles.dart' as style;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => OrgBloc(EmptyOrg())
            ..add(
              FetchOrg(),
            ),
        ),
        BlocProvider(create: (ctx) => OrgInfoBloc(EmptyInfo())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SmartQ',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: style.primaryColor,
          primarySwatch: Colors.cyan,
          // primarySwatch: ,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BlocBuilder<OrgBloc, OrgState>(
          builder: (context, state) {
            if (state is LoadedOrg) {
              return HomePage(
                title: 'SmartQ',
              );
            }
            return SplashPage();
          },
        ),
      ),
    );
  }
}
