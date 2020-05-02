import 'package:flutter/material.dart';
import 'package:laundry_app/Screens/HomeScreen.dart';
import 'package:laundry_app/Screens/LoginOrSignupOption.dart';
import 'package:laundry_app/Screens/LoginScreen.dart';
import 'package:laundry_app/Screens/OrderDetails.dart';
import 'package:laundry_app/utils/colors.dart';

void main() {
  runApp(
     MaterialApp(
       theme: ThemeData(
         fontFamily: 'Circe',
         textSelectionColor: greenColor,
         textSelectionHandleColor: greenColor,
       ),
       debugShowCheckedModeBanner: false,
    title: 'Laundry App',
    home: LoginSignupOption()
    )
  );
}