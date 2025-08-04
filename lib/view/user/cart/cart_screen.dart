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
          preferredSize: Size(width * 1, height * 0.08),
          child: HomePageAppBar(width: width, height: height),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          height: height,
          width: width,

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Subtotal ', style: textTheme.bodyLarge),
                      TextSpan(
                        text: '\$1800',
                        style: textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                CommonFunctions.blankSpace(height * 0.01, 0),

                SizedBox(
                  height: height * 0.06,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle, color: teal),
                      CommonFunctions.blankSpace(0, width * 0.02),

                      Expanded(
                        child: Column(
                          children: [
                            RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'Your Order is eligible for FREE Delivery.',
                                    style: textTheme.bodySmall!.copyWith(
                                      color: teal,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Select this options at checkout.',
                                    style: textTheme.bodySmall!.copyWith(
                                      color: black,
                                    ),
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

                CommonFunctions.blankSpace(height * 0.01, 0),

                ElevatedButton(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: amber,
                    minimumSize: Size(width, height * 0.06),
                  ),
                  child: Text(
                    'Proceed to Buy(2 items)',
                    style: textTheme.bodyMedium,
                  ),
                ),

                CommonFunctions.blankSpace(height * 0.02, 0),

                CommonFunctions.divider(),

                CommonFunctions.blankSpace(height * 0.02, 0),

                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      // height: height * 0.2,
                      width: width,
                      padding: EdgeInsets.symmetric(
                        horizontal: width*0.001,
                        vertical: height*0.001,
                      ),
                      margin: EdgeInsets.symmetric(vertical: height * 0.01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greyShade1,
                      ),

                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                  image: AssetImage(
                                    'assets/images/todays_deals/todaysDeal0.png',
                                  ),
                                  fit: BoxFit.fitWidth,
                                ),
                                CommonFunctions.blankSpace(height*0.01, 0),
                                Container(
                                  height: height * 0.06,
                                  width: width * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: greyShade3),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                color: greyShade3,
                                              ),
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.remove,
                                            color: black,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          color: white,
                                          alignment: Alignment.center,
                                          child: Text('1'),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              left: BorderSide(
                                                color: greyShade3,
                                              ),
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          CommonFunctions.blankSpace(0, width*0.02),
                          Expanded(
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Product Name',
                                  style: textTheme.bodyLarge,
                                ),
                                CommonFunctions.blankSpace(height*0.01, 0),
                                Text(
                                  '\$ Product Price',
                                  style: textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                CommonFunctions.blankSpace(height*0.005, 0),
                                Text(
                                  'Eligible For Free Shipping.',
                                  style: textTheme.bodySmall!.copyWith(
                                    color: grey,
                                  ),
                                ),

                                CommonFunctions.blankSpace(height*0.005, 0),
                                Text(
                                  'In Stock',
                                  style: textTheme.bodySmall!.copyWith(
                                    color: teal,
                                  ),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: (){

                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: white,
                                        side: BorderSide(
                                          color: grey,
                                        ),
                                      ),
                                      child: Text(
                                        'Delete',
                                        style: textTheme.bodySmall,
                                      ),
                                    ),

                                    // CommonFunctions.blankSpace(0, width*0.01),

                                    ElevatedButton(
                                      onPressed: (){

                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: white,
                                        side: BorderSide(
                                          color: grey,
                                        ),
                                      ),
                                      child: Text(
                                        'Bookmark',
                                        style: textTheme.bodySmall,
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
