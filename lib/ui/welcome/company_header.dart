import 'package:flutter/cupertino.dart';

const companyLogoImageName = 'assets/images/logo_placeholder.png';

class CompanyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(companyLogoImageName)
      ],
    );
  }
}