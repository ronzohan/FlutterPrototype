import 'package:flutter/material.dart';
import 'package:rush_revamp/ui/dashboard/models/menu.dart';
import 'menu_tile.dart';

class MenuList extends StatelessWidget {
  final List<Menu> menus;
  final itemsPerPage = 3;

  MenuList(this.menus);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
          itemCount: menus.length ~/ itemsPerPage,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _buildMenuRowFor(page: index);
          },
      ),
      padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
      height: 80.0,
    );
  }

  Widget _buildMenuRowFor({num page}) {
    final pageMenus = _menusAtPage(page);

    final pageMenuTiles = pageMenus.map((menu) =>
      Container(
        child: MenuTile(image: menu.image, title: menu.title),
      ));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: pageMenuTiles.toList()
    );
  }

  List<Menu>_menusAtPage(num page) {
    final pageCount = menus.length / itemsPerPage;
    
    assert(pageCount > page);

    return menus.getRange(
        itemsPerPage * page,
        (itemsPerPage * page) + itemsPerPage
    ).toList();
  }
}