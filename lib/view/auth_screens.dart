import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {

    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    final textTheme=Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title:Image(
            image:AssetImage('assets/images/amazon_logo.png'),
            height: height*0.04,
            width: width,
          ),
        ),
        body:SafeArea(
          child: Container(
            height: height,
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width*0.03,
              vertical: height*0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style:textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w600),
                ),
                CommonFunctions.blankSpace(height*0.02, 0),
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    border: Border.all(color: greyShade3),
                  ),
                  child: Column(

                  ),
                ),

              ],
            ),
          ),

        ),
    );
  }
}
