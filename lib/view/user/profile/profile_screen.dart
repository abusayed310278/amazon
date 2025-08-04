import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
          preferredSize: Size(width*1,height*0.08),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: width*0.03,
              vertical: height*0.01,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: appBarGradientColor,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
      
            child: Row(
              children: [
                Image(
                  image: const AssetImage(
                    'assets/images/amazon_logo.png',
                  ),
                  height: height*0.04,
                ),
                const Spacer(),
                IconButton(
                  onPressed: (){

                  },
                  icon: Icon(
                    Icons.notifications_none,
                    color: black,
                    size: height*0.03,
                  ),
                ),
                IconButton(
                  onPressed: (){

                  },
                  icon: Icon(
                    Icons.search,
                    color: black,
                    size: height*0.03,

                  ),
                ),
              ],
            ),
          ),
      
        ),
        body:Container(
          width: width,
          padding: EdgeInsets.symmetric(
            vertical: height*0.02,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:'Hello, ',
                        style:textTheme.bodyLarge,
                      ),
                      TextSpan(
                        text:'Said',
                        style:textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ),

                const Spacer(),

                CircleAvatar(
                  backgroundColor: greyShade3,
                  radius: height*0.025,

                ),
              ],
            ),
          ),
        ),
      
      ),
    );
  }
}
