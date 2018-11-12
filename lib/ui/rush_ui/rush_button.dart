import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rush_revamp/ui/styles/colors.dart';
import 'package:rush_revamp/ui/styles/fonts.dart';

class RushButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const RushButton({
    @required this.onPressed,
    @required this.title
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 55.0,
      borderRadius: BorderRadius.circular(55 / 2),
      child: Text(
          title,
          style: appTextStyle.copyWith(
              color: Colors.white,
              fontSize: 19.0
          )
      ),
      color: RushRevampColors.orange,
      onPressed: onPressed,
      pressedOpacity: 0.5,
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 55.0,
      borderRadius: BorderRadius.circular(55 / 2),
      child: Text(
        'LOGIN',
        style: appTextStyle.copyWith(
          color: Colors.white,
          fontSize: 19.0
        )
      ),
      color: RushRevampColors.orange,
      onPressed: () => () {
        print('Hello world');
      },
      pressedOpacity: 0.5,
    );
  }
}

class CreateAccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: RushRevampColors.orange),
        borderRadius: BorderRadius.circular(55 / 2),
      ),
      child: CupertinoButton(
        minSize: 55.0,
        borderRadius: BorderRadius.circular(55 / 2),
        child: Container(
          child: Text(
            'CREATE ACCOUNT',
            style: TextStyle(
            color: RushRevampColors.orange
            ),
          )
        ),
        color: Colors.white,
        onPressed: () => () {
          print('Hello world');
        },
      ),
    );
  }
}