import 'package:flutter/material.dart';
import 'package:laundry_app/utils/colors.dart';

class ButtonWidget extends StatelessWidget {
  Text text;
  Color backgroundColor = whiteColor;
  Color shadowColor = whiteColor;
  Function onPress;
  ButtonWidget({@required this.text,@required this.backgroundColor,@required this.shadowColor, @required this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      height: MediaQuery.of(context).size.height * 0.10,
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 8),
      child: Card(
          color: backgroundColor,
          child: FlatButton(
              child: Center(
                child: text,
              ),
              onPressed: () {
                onPress(context);
              })),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: shadowColor,
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset(0.0, 5.0)),
      ]),
    );
  }
}
