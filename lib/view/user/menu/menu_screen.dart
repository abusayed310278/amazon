import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: Size(width*1,height*1),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: appBarGradientColor,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),

      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height*0.06,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: addressBarGradientColor,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
