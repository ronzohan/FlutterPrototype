import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DashboardHeader extends StatelessWidget {
  String name;
  String mobileNumber;

  DashboardHeader({this.name, this.mobileNumber});

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
      padding: EdgeInsets.only(left: 16.0, bottom: 16.0, right: 16.0, top: 16.0),
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
                  fontSize: 16.0)),
          ImageIcon(AssetImage(nextImageName), color: Colors.white),
        ],
      ),
      color: Color(0x26212121),
      padding: EdgeInsets.only(left: 16.0, right: 12.0),
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
      height: 55.0,
      width: 55.0,
    );
  }

  Widget _buildUserName() {
    return Container(
      child: Column(
        children: [
          Text(
            this.name,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            this.mobileNumber,
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 10.0,
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
