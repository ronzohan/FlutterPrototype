import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  final Widget image;

  final Widget title;

  const MenuTile({
    @required this.image,
    @required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: image,
        ),
        title
      ],
    );
  }
}