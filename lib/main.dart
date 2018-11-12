import 'package:flutter/cupertino.dart';
import 'package:rush_revamp/ui/dashboard/dashboard_page.dart';
import 'package:rush_revamp/ui/welcome/welcome_page.dart';
import 'package:rush_revamp/ui/login/login_page.dart';
import 'package:rush_revamp/ui/routes.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: WelcomePage(),
      routes: {
        Routes.DASHBOARD_PAGE: (context) => DashboardPage(),
        Routes.LOGIN_PAGE: (context) => LoginPage()
      },
    );
  }
}