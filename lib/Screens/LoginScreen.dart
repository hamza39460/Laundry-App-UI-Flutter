import 'package:flutter/material.dart';
import 'package:laundry_app/Screens/HomeScreen.dart';
import 'package:laundry_app/Widgets/BackgroundContainer.dart';
import 'package:laundry_app/Widgets/ButtonWidget.dart';
import 'package:laundry_app/Widgets/CardBackground.dart';
import 'package:laundry_app/Widgets/InputWidget.dart';
import 'package:laundry_app/Widgets/Keyboard_UnFocus_Widget.dart';
import 'package:laundry_app/utils/Common.dart';
import 'package:laundry_app/utils/appRoutes.dart';
import 'package:laundry_app/utils/colors.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: GestureDetectorWidget(
        child: _body(context),
      )
    );
  }

  _body(BuildContext context) {
    return Stack(
      children: <Widget>[
        BackgroundContainer(),
        _form(context),
      ],
    );
  }

  _form(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: SingleChildScrollView(
        //autoScroll: true,
        child: ListView(
          shrinkWrap: true,
          //mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //LogoWidget(),
            _backButton(context),
            
            Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                alignment: Alignment.topLeft,
                child: Text('Login to your account',
                    style: TextStyle(
                        fontSize: Common.getSPfont(26),//26,
                        fontWeight: FontWeight.bold,
                        color: whiteColor))
            ),
            
            _inputCard(context),
          ],
        ),
      ),
    );
  }

  _backButton(context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: whiteColor,
          size: 30,
        ),
        onPressed: () {
          AppRoutes.pop(context);
        }
      ),
    );
  }

  _inputCard(BuildContext context) {
    return CardBackground(
    child: Container(

      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(top: 20.0),
      child: _LoginForm(),
    ),
        );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child:Column(
        //shrinkWrap: true,
        children: <Widget>[
          
          _showEmailInput(),
          _showPwdInput(),
          _showForgotPasswordInput(),
          _showLoginBtn()
          
          
           
        ],
      ),
    );
  }

  _showEmailInput(){
    return InputWidget(
            labelText: 'Email',
            hintText: 'Please enter your email',
            obscureText: false,
            keyBoardType: TextInputType.emailAddress,
            controller: _emailController,
          );
  }

  _showPwdInput(){
    return InputWidget(
            labelText: 'Password',
            hintText: 'Please enter your password',
            obscureText: true,
            keyBoardType: TextInputType.visiblePassword,
            controller: _pwdController,
          );
  }

  _showForgotPasswordInput(){
    return Align(
            alignment: Alignment.topRight,
            child: FlatButton(
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                    color: greenColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Common.getSPfont(15)),
              ),
              onPressed: () => print('Forgot Password Clicked'),
            ),
          );
  }

  _showLoginBtn(){
    return ButtonWidget(
            text: Text('Login',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Common.getSPfont(21),
                    color: whiteColor)),
            backgroundColor: greenColor,
            onPress: _loginPressed,
            shadowColor: whiteColor,
          );
  }

  _loginPressed(BuildContext context){
    setState(() {

    //_formKey.currentState.reset();  
    _emailController.clear();
    _pwdController.clear();  
    AppRoutes.makeFirst(context, HomeScreen());  
    // _emailController.clear();
    // _pwdController.clear();
    // if(_loginText!='heeloo')
    //   _loginText="heeloo";
    // else
    //    _loginText="Login";
    });
    
    print('login pressed');
  }
}
