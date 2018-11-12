import 'package:flutter/cupertino.dart';
import 'company_header.dart';
import 'package:rush_revamp/ui/rush_ui/rush_button.dart';
import 'package:rush_revamp/ui/routes.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 50.0),
                CompanyHeader(),
                SizedBox(height: 69.0,),
                RushButton(
                  title: 'LOGIN',
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.LOGIN_PAGE);
                  },
                ),
                SizedBox(height: 15.0,),
                CreateAccountButton()
              ],
            ),
          ),
      )
    );
  }
}
