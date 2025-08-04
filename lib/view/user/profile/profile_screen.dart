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
        body: Container(
          width: width,
          padding: EdgeInsets.symmetric(
            vertical: height * 0.01,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hello, ',
                            style: textTheme.bodyLarge,
                          ),
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
                    CircleAvatar(
                      backgroundColor: greyShade3,
                      radius: height * 0.025,
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.02),

              // Expanded to allow GridView to scroll inside Column
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: width*0.04,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3.1,
                  ),
                  itemCount: 4, // example count

                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:grey,
                        ),

                        color: greyShade2,
                        borderRadius: BorderRadius.circular(50),

                      ),
                      child: Builder(
                        builder: (context){
                          if(index==0){
                            return Text(
                              'Your Orders',
                              style: textTheme.bodyMedium,
                            );
                          }
                          if(index==1){
                            return Text(
                              'Buy again',
                              style: textTheme.bodyMedium,
                            );
                          }
                          if(index==2){
                            return Text(
                              'Your Account',
                              style: textTheme.bodyMedium,
                            );
                          }
                            return Text(
                              'Your Wish List',
                              style: textTheme.bodyMedium,
                            );
                        },
                      ),
                    );
                  },
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
            ],
          ),
        ),


      ),
    );
  }
}
