import 'package:flutter/cupertino.dart';
import 'package:rush_revamp/ui/dashboard/dashboard_page.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: DashboardPage(),
    );
  }
}