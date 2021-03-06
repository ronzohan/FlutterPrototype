import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'rewards_item.dart';
import 'package:rush_revamp/api/models/rewards_list.dart';
import 'shop_learn_more_header.dart';
import 'package:rush_revamp/api/api_manager.dart';
import 'menu_list.dart';
import 'models/menu.dart';
import 'dashboard_header.dart';
import 'all_rewards_header.dart';
import 'package:rush_revamp/ui/styles/colors.dart';
import 'package:rush_revamp/api/api_manager.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with RouteAware {

  final List<Menu> items = [
    Menu(
        Image.asset('assets/images/ic_digital.png'),
        'Digital'
    ),

    Menu(
        Image.asset('assets/images/ic_scan.png'),
        'Scan'
    ),
    Menu(
        Image.asset('assets/images/ic_badge.png'),
        'Badge'
    ),
    Menu(
        Image.asset('assets/images/ic_gcash.png'),
        'GCash'
    ),
    Menu(
        Image.asset('assets/images/ic_booking.png'),
        'Booking'
    ),
    Menu(
        Image.asset('assets/images/ic_restaurant.png'),
        'Restaurant'
    )
  ];

 List<RewardsItem> rewardsList = [];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Container(
            child: SafeArea(
              child: DashboardHeader(
                name: UserManager.userName, 
                mobileNumber: UserManager.userMobileNumber
              ),
              bottom: false,
            ),
            color: RushRevampColors.orange,
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
                        MenuList(items),
                        Container(
                          height: 6.0,
                          color: Color(0xFFE5E5EA),
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
                    sliver: SliverGrid.extent(
                      maxCrossAxisExtent: 200.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      children: rewardsList,
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

  @override
  void initState() {
    super.initState();
    APIManager.shared.featuredRewards(count: 4).then((rewardsList) {
      updateGridView(rewards: rewardsList.list);
    });
  }

  void updateGridView({List<Reward> rewards}) {
    setState(() {
      rewardsList = rewards.map((reward) {
        return RewardsItem(
          name: reward.name,
          description: reward.description, 
          imageURL: reward.image,
          points: reward.points
        );
      }).toList();    
    });
  }
}

