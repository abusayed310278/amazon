import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
