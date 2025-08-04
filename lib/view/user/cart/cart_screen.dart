import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/view/user/home/home_screen.dart';
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
          preferredSize: Size(width*1,height*0.08),
          child: HomePageAppBar(width: width,height: height,),

        ),
        body:Container(
          padding: EdgeInsets.symmetric(
            horizontal: width*0.03,
            vertical: height*0.02,
          ),
          height: height,
          width: width,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Subtotal ',
                        style: textTheme.bodyLarge,
                      ),
                      TextSpan(
                        text: '\$1800',
                        style: textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
              ),
              CommonFunctions.blankSpace(height*0.01, 0),

              SizedBox(
                height: height*0.06,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_circle,color:teal),
                    CommonFunctions.blankSpace(0, width*0.02),

                    Expanded(
                      child: Column(
                        children: [
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              children: [

                                TextSpan(
                                  text:'Your Order is eligible for FREE Delivery.',
                                  style: textTheme.bodySmall!.copyWith(
                                    color: teal,

                                  )
                                ),
                                TextSpan(
                                    text:'Select this options at checkout.',
                                    style: textTheme.bodySmall!.copyWith(
                                      color: black,

                                    )
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),

              CommonFunctions.blankSpace(height*0.01, 0),

              ElevatedButton(
                onPressed: () {  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: amber,
                  minimumSize: Size(
                    width,height*0.06
                  ),
                ),
                child: Text(
                  'Proceed to Buy(2 items)',
                  style: textTheme.bodyMedium,
                ),

              ),

              CommonFunctions.blankSpace(height*0.01, 0),

            ],
          ),
        ),

      ),
    );
  }
}
