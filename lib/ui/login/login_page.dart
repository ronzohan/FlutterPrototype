import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_header.dart';
import 'package:rush_revamp/ui/rush_ui/rush_textfield.dart';
import 'package:rush_revamp/ui/styles/fonts.dart';
import 'package:rush_revamp/ui/styles/colors.dart';
import 'package:rush_revamp/ui/rush_ui/rush_button.dart';
import 'package:rush_revamp/ui/routes.dart';


const backButtonImageName = 'assets/images/ic_back.png';

class LoginPage extends StatefulWidget {
  String mobileNumber;
  String pin;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginTextController;
  TextEditingController pinTextController;

  RushTextField loginTextField;
  RushTextField pinTextField;

  @override
  void initState() {
    super.initState();
    loginTextField = _buildLoginTextField();
    pinTextField = _buildPinTextField();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        border: Border.all(color: Colors.white),
        backgroundColor: Colors.white,
        leading: CupertinoButton(
          child: Image.asset(backButtonImageName),
          onPressed: () {
            Navigator.pop(context);
          },
          padding: EdgeInsets.all(0.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            LoginHeader(),
            _buildForms(),
            SizedBox(height: 29.0),
            _buildForgotPinButton(),
            SizedBox(height: 29.0),
            _buildLoginButton()
          ],
        ),
      ),
    );
  }

  Widget _buildForms() {
    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        loginTextField,
        SizedBox(height: 28.0),
        pinTextField
      ],
    );
  }

  Widget _buildLoginTextField() {
    print('Build textfield');
    RushTextField loginTextField = RushTextField(
      title: 'My mobile number',
      hintText: 'Enter mobile number'
    );
    loginTextController = loginTextField.textEditingController;
    return loginTextField;
  }

  Widget _buildPinTextField() {
    RushTextField pinTextField = RushTextField(
      hintText: 'Enter 4 digit pin',
      obscureText: true,
      maxLength: 4,
    );
    return pinTextField;
  }

  Widget _buildForgotPinButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CupertinoButton(
          child: Text(
            'Forgot PIN?',
            style: appTextStyle.copyWith(
              color: RushRevampColors.orange,
              fontSize: 13.0
            ),
            textAlign: TextAlign.start,
          ),
          padding: EdgeInsets.all(0.0),
          onPressed: () {
            print('Forgot pin selected');
          },
          pressedOpacity: 0.5,
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return RushButton(
      title: 'LOGIN',
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.DASHBOARD_PAGE, (route) {
              return false;
            });
        //Navigator.replace(context, oldRoute: null, newRoute: null)
        Navigator.pushReplacementNamed(context, Routes.DASHBOARD_PAGE);
      },
    );
  }
}

