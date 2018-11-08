import 'package:flutter/material.dart';

class RewardsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final placeholderImageName = 'assets/images/ic_placeholder.png';

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Color(0xFFE5E5EA),
              ),
              child: Image.asset(placeholderImageName),
            )
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            'One (1) Large NY Style Super Supereme Pizza',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 13.0,
              color: Color(0xFF212121)
            ),  
          ),
          SizedBox(
            height: 3.0,
          ),
          Text(
            '20 Points',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontSize: 13.0,
              color: Color(0xFF646D7C)
            )
          )
        ],
      )
    );
  }
}