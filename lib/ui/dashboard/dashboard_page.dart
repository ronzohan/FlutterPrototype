import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Column(
      children: [
        Container(
          child: SafeArea(
            child: DashboardHeader(),
            bottom: false,
          ),
          color: Color(0xFFFF8828),
        ),
        Expanded(
          child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(color: Colors.red, height: 150.0),
                ],
              ),
            ),
          ],
        ),
        )
      ],
    ));
  }
}

class DashboardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildProfileInfo();
  }

  Widget _buildProfileInfo() {
    return Container(
      child: Row(
        children: [
          _buildProfileImage(),
          Expanded(child: _buildUserName()),
          _buildPointInfo()
        ],
        mainAxisAlignment: MainAxisAlignment.start,
      ),
      color: Color(0xFFFF8828),
      padding: EdgeInsets.only(left: 16, bottom: 16, right: 16),
    );
  }

  Widget _buildPointInfo() {
    final buttonHeight = 40.0;
    final nextImageName = 'assets/images/ic_next.png';

    return CupertinoButton(
      child: Row(
        children: [
          Text('2000 Point',
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
          ImageIcon(AssetImage(nextImageName), color: Colors.white),
        ],
      ),
      color: Color(0x26212121),
      padding: EdgeInsets.only(left: 16, right: 12),
      minSize: buttonHeight,
      borderRadius: BorderRadius.all(Radius.circular(buttonHeight / 2)),
      onPressed: () {
        debugPrint('Points tapped');
      },
      pressedOpacity: 0.5,
    );
  }

  Widget _buildProfileImage() {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(55 / 2)),
      height: 55,
      width: 55,
    );
  }

  Widget _buildUserName() {
    return Container(
      child: Column(
        children: [
          Text(
            'John',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'Member',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 10,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.normal,
            ),
            overflow: TextOverflow.ellipsis,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      padding: EdgeInsets.only(left: 12.0, right: 12.0),
    );
  }
}
