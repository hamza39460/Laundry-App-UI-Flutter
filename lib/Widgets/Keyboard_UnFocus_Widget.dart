import 'package:flutter/material.dart';

class GestureDetectorWidget extends StatelessWidget {
  Widget child;
  GestureDetectorWidget({@required this.child});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
    );
  }
}