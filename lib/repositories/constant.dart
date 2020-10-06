import 'package:flutter/material.dart';

import '../size_config.dart';

const BASE_URL = 'https://smartq-server.heitecharena.com/smartq/';
const API_ORG_LIST = 'organisation.json?quesortImi';
const API_ORG_INFO = 'organisation.json?imi-info=';

const kPrimaryColor = Color(0xFF26C6DA);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kTextColor = Color(0xFF000000);
const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kFullNamaError = "Please Enter your name";
const String kInvalidFullNameError = "Please Enter Valid Username";
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
