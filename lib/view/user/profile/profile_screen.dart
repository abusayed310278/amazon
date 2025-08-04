import 'package:amazon/constants/common_functions.dart';
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
          preferredSize: Size(width * 1, height * 0.08),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.01,
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
                  image: const AssetImage('assets/images/amazon_logo.png'),
                  height: height * 0.04,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    color: black,
                    size: height * 0.03,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: black, size: height * 0.03),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: width,
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            child: Column(
              children: [
                UserGreetingsYouScreen(
                  width: width,
                  textTheme: textTheme,
                  height: height,
                ),

                CommonFunctions.blankSpace(height * 0.02, 0),

                // Expanded to allow GridView to scroll inside Column
                YouGridBtons(width: width, textTheme: textTheme),

                UsersOrders(width: width, height: height, textTheme: textTheme),
                CommonFunctions.blankSpace(height * 0.01, 0),

                CommonFunctions.divider(),

                KeepShopping(width: width, height: height, textTheme: textTheme),

                CommonFunctions.blankSpace(height * 0.01, 0),

                CommonFunctions.divider(),

                BuyAgain(width: width, height: height, textTheme: textTheme),



              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KeepShopping extends StatelessWidget {
  const KeepShopping({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
  });

  final double width;
  final double height;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.01,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Text(
                'Keep Shopping for',
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),


              // TextButton(
              //   onPressed: () {},
              //   child: Text(
              //     'Edit',
              //     style: textTheme.bodySmall!.copyWith(color: blue),
              //   ),
              // ),

              // const Spacer(),

              TextButton(
                onPressed: () {},
                child: Text(
                  'Browsing History',
                  style: textTheme.bodySmall!.copyWith(color: blue),
                ),
              ),
            ],
          ),

          CommonFunctions.blankSpace(height*0.01, 0),

          GridView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: const PageScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context,index){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: greyShade3),
                        borderRadius: BorderRadius.circular(10),
                      ),

                    ),
                  ),
                  Text(
                    'Product',
                    style: textTheme.bodyMedium,
                  ),
                ],
              );
            },
          ),


        ],
      ),
    );
  }
}

class BuyAgain extends StatelessWidget {
  const BuyAgain({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
  });

  final double width;
  final double height;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.01,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Buy Again, ',
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: textTheme.bodySmall!.copyWith(color: blue),
                ),
              ),
            ],
          ),

          SizedBox(
            height: height * 0.14,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const PageScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  width: height * 0.14,
                  height: height * 0.14,
                  margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyShade3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UsersOrders extends StatelessWidget {
  const UsersOrders({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
  });

  final double width;
  final double height;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.01,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Your Orders, ',
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: textTheme.bodySmall!.copyWith(color: blue),
                ),
              ),
            ],
          ),

          SizedBox(
            height: height * 0.17,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const PageScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  width: width * 0.4,
                  height: height * 0.17,
                  margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyShade3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UserGreetingsYouScreen extends StatelessWidget {
  const UserGreetingsYouScreen({
    super.key,
    required this.width,
    required this.textTheme,
    required this.height,
  });

  final double width;
  final TextTheme textTheme;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: 'Hello, ', style: textTheme.bodyLarge),
                TextSpan(
                  text: 'Said',
                  style: textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          CircleAvatar(backgroundColor: greyShade3, radius: height * 0.025),
        ],
      ),
    );
  }
}

class YouGridBtons extends StatelessWidget {
  const YouGridBtons({super.key, required this.width, required this.textTheme});

  final double width;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3.1,
      ),
      itemCount: 4,

      // example count
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: grey),

            color: greyShade2,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Builder(
            builder: (context) {
              if (index == 0) {
                return Text('Your Orders', style: textTheme.bodyMedium);
              }
              if (index == 1) {
                return Text('Buy again', style: textTheme.bodyMedium);
              }
              if (index == 2) {
                return Text('Your Account', style: textTheme.bodyMedium);
              }
              return Text('Your Wish List', style: textTheme.bodyMedium);
            },
          ),
        );
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
