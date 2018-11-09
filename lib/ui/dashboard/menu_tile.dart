import 'package:flutter/material.dart';
import 'package:rush_revamp/ui/styles/fonts.dart';

final _menuTileTextStyle = appTextStyle.copyWith(
    fontWeight: FontWeight.normal,
    fontSize: 11.0,
    fontStyle: FontStyle.normal
);

const kMenuImageHeight = 30.0;

class MenuTile extends StatelessWidget {
  final Widget image;
  final String title;

  const MenuTile({
    @required this.image,
    @required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        image,
        SizedBox(height: 10.0),
        Text(
          title,
          style: _menuTileTextStyle,
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}