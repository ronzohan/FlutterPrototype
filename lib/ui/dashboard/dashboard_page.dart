import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rush_revamp/ui/dashboard/rewards_item.dart';
import 'package:rush_revamp/ui/dashboard/shop_learn_more_header.dart';
import 'package:rush_revamp/ui/dashboard/menu_tile.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final items = List<String>.generate(3, (i) => "Item $i");
  final images = List<String>.of([
    'assets/images/ic_badge.png',
    'assets/images/ic_scan.png',
    'assets/images/ic_digital.png'
  ]);

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
                SliverSafeArea(
                  top: false,
                  bottom: false,
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          child: ListView.builder(
                            itemCount: items.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return MenuTile(
                                title: Text('${items[index]}'),
                                image: Image(
                                  image: AssetImage(
                                    images[index],
                                  ),
                                ),
                              );
                            },
                          ),
                          height: 70.0,
                        ),
                        ShopLearnMoreHeader(),
                        SizedBox(
                          height: 12.0,
                        ),
                        Container(
                          height: 2.0,
                          color: Color(0xFFE5E5EA),
                          margin: EdgeInsets.only(left: 20.0, right: 20.0),
                        ),
                        AllRewardsHeader()
                      ],
                    ),
                  ),
                ),
                SliverSafeArea(
                  top: false,
                  sliver: SliverPadding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300.0,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return RewardsItem();
                        },
                        childCount: 10,
                      ),
                    ),
                  )
                )
              ],
            ),
          )
        ],
      )
    );
  }
}

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
                color: Color(0xFFFF8828),
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
            'John',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'Member',
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
