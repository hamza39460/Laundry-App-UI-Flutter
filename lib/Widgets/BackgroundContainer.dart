import 'package:flutter/material.dart';
import 'package:laundry_app/utils/colors.dart';

class BackgroundContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: greenColor,
          ),
        ),
        _backgroundImage(context),
      ],
    );
  }

  Widget _backgroundImage(BuildContext context) {
    return Positioned(
        height: MediaQuery.of(context).size.height * 0.22,
        width: MediaQuery.of(context).size.width,
        top: MediaQuery.of(context).size.height * 0.01,
        child: Image.asset("assets/images/background.png"));
  }
}
