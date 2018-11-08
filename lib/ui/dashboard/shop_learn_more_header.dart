import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopLearnMoreHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildShopLearnHeader();
  }

  Widget _buildRewardsTextInfo() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(
              'Shop for Rewards',
              style: TextStyle(
                color: Color(0xFFFF8828),
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 16.0
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'Start shopping to earn points and exchange it with amazing rewards.',
              style: TextStyle(
                color: Color(0xFF212121),
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.normal,
                fontSize: 13.0
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            CupertinoButton(
              child: Text(
                'Learn More',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  fontSize: 13.0
                )
              ),
              color: Color(0xFFFF8828),
              onPressed: () { 
                debugPrint('Clicked learn more');
              },
              pressedOpacity: 0.5,
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 5.0, bottom: 5.0),
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            )
        ],
      ),
    );
  }
  Widget _buildShopLearnHeader() {
    final giftImageName = 'assets/images/ic_gift_coin.png';

    return Row(
      children: [
        Expanded(
          child: _buildRewardsTextInfo(),
        ),
        Image.asset(
          giftImageName,
          height: 120.0,
          width: 120.0,
        )
      ],
    );
  }
}