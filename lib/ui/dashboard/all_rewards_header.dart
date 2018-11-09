import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rush_revamp/ui/styles/colors.dart';

class AllRewardsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'All Rewards',
              style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'OpenSans',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          CupertinoButton(
            child: Text(
              'View All',
              style: TextStyle(
                  color: RushRevampColors.orange,
                  fontSize: 13.0,
                  fontFamily: 'OpenSans',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold
              ),
            ),
            onPressed: () {
              debugPrint('View all');
            },
            pressedOpacity: 0.5,
            padding: const EdgeInsets.all(0.0),
          )
        ],
      ),
    );
  }
}