import 'package:amazon/view/seller/inventory/inventory_screen.dart';
import 'package:amazon/view/seller/monitor/monitor_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:amazon/view/user/cart/cart_screen.dart';
import 'package:amazon/view/user/home/home_screen.dart';
import 'package:amazon/view/user/menu/menu_screen.dart';
import 'package:amazon/view/user/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(SellerBottomNavBar());

class SellerBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Bottom Navigation Bar Demo',
      home: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: InventoryScreen(),
            item: ItemConfig(
              icon: Icon(Icons.inventory_outlined),
              title: "Inventory",
            ),
          ),
          PersistentTabConfig(
            screen: MonitorScreen(),
            item: ItemConfig(
              icon: Icon(Icons.bar_chart_outlined),
              title: "Monitor",
            ),
          ),

        ],
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      ),
    );
  }
}
