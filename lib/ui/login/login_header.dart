import 'package:flutter/widgets.dart';
import 'package:rush_revamp/ui/styles/fonts.dart';
import 'package:rush_revamp/ui/styles/colors.dart';

class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 4.0,
          bottom: 4.0
      ),
      child: Text(
        'Login',
        style: appTextStyle.copyWith(
            color: RushRevampColors.black,
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal
        ),
      ),
    );
  }
}