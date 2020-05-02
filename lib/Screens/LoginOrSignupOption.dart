import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_app/Screens/LoginScreen.dart';
import 'package:laundry_app/Widgets/BackgroundContainer.dart';
import 'package:laundry_app/Widgets/ButtonWidget.dart';
import 'package:laundry_app/Widgets/CardBackground.dart';
import 'package:laundry_app/utils/Common.dart';
import 'package:laundry_app/utils/appRoutes.dart';

import 'package:laundry_app/utils/colors.dart';

class LoginSignupOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Common.ScreenInit(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: <Widget>[BackgroundContainer(), _form(context)],
    );
  }

  Widget _form(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: Column(
        children: <Widget>[
         
          _LogoWidget(),
          _inputCard(context),
        ],
      ),
    );
  }


  Widget _inputCard(BuildContext context) {
    return Expanded(
      child: CardBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //shrinkWrap: true,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  alignment: Alignment.topLeft,
                  child: Text('Welcome to our app!',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(78)//26
                          , fontWeight: FontWeight.bold))),
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 8, 0),
                  alignment: Alignment.topLeft,
                  child: Text(
                      'This is the first version of our laundry app.\nPlease sign in or create an account below.',
                      style: TextStyle(fontSize:Common.getSPfont(17)))),
              _showLoginButton(),
              _showSignupButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showLoginButton() {
    return ButtonWidget(
      text: Text(
        'Login',
        style: TextStyle(
            fontSize: Common.getSPfont(21), fontWeight: FontWeight.bold, color: greenColor),
        textAlign: TextAlign.center,
      ),
      backgroundColor: whiteColor,
      shadowColor: greenColor0,
      onPress: _loginOnPress,
    );
  }

  Widget _showSignupButton() {
    return ButtonWidget(
      text: Text(
        'Create an account',
        style: TextStyle(
            fontSize: Common.getSPfont(21), fontWeight: FontWeight.bold, color: whiteColor),
        textAlign: TextAlign.center,
      ),
      backgroundColor: greenColor,
      shadowColor: whiteColor,
      onPress: _signupOnpress,
    );
  }

  _loginOnPress(BuildContext context) {
    AppRoutes.push(context, LoginScreen());
  }

  _signupOnpress(BuildContext context) {
    AppRoutes.push(context, LoginScreen());
  }
}

class _LogoWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(4),
        child: _logo(context),
    );
  }
  Widget _logo(BuildContext context) {
    return Center(
        child: Image.asset(
      "assets/images/logo.png",
      height: MediaQuery.of(context).size.height * 0.40,
      width: MediaQuery.of(context).size.width * 0.50,
    ));
  }
}