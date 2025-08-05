import 'package:flutter/material.dart';
import 'package:amazon/constants/common_functions.dart';
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
          child: Column(
            children: [

              YouGridBtons(width: width, textTheme: textTheme),
              CommonFunctions.blankSpace(height * 0.02, 0),
              UsersOrders(width: width, height: height, textTheme: textTheme),
              CommonFunctions.blankSpace(
                height * 0.01,
                0,
              ),
              CommonFunctions.divider(),
              KeepShopping(
                  width: width, height: height, textTheme: textTheme),
              CommonFunctions.blankSpace(
                height * 0.01,
                0,
              ),
              CommonFunctions.divider(),
              BuyAgain(width: width, height: height, textTheme: textTheme)

            ],
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
          horizontal: width * 0.04, vertical: height * 0.01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Keep Shopping for',
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Browsing history',
                style: textTheme.bodySmall!.copyWith(
                  color: blue,
                ),
              ),
            ],
          ),
          CommonFunctions.blankSpace(
            height * 0.02,
            0,
          ),
          // StreamBuilder(
          //     stream: UsersProductService.fetchKeepShoppingForProducts(),
          //     builder: (context, snapshot) {
          //       if (snapshot.data!.isEmpty) {
          //         return Container(
          //           height: height * 0.15,
          //           width: width,
          //           alignment: Alignment.center,
          //           child: Text(
          //             'Start Browsing for Products',
          //             style: textTheme.bodyMedium,
          //           ),
          //         );
          //       }
          //
          //       if (snapshot.hasData) {
          //         List<ProductModel> products = snapshot.data!;
          //         return GridView.builder(
          //             itemCount: (products.length > 6) ? 6 : products.length,
          //             shrinkWrap: true,
          //             physics: const PageScrollPhysics(),
          //             gridDelegate:
          //             const SliverGridDelegateWithFixedCrossAxisCount(
          //                 crossAxisCount: 3,
          //                 mainAxisSpacing: 10,
          //                 crossAxisSpacing: 10,
          //                 childAspectRatio: 0.8),
          //             itemBuilder: (context, index) {
          //               ProductModel currentProduct = products[index];
          //               return InkWell(
          //                 onTap: () {
          //                   Navigator.push(
          //                     context,
          //                     PageTransition(
          //                       child:
          //                       ProductScreen(productModel: currentProduct),
          //                       type: PageTransitionType.rightToLeft,
          //                     ),
          //                   );
          //                 },
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Expanded(
          //                       child: Container(
          //                         decoration: BoxDecoration(
          //                           border: Border.all(
          //                             color: greyShade3,
          //                           ),
          //                           borderRadius: BorderRadius.circular(
          //                             10,
          //                           ),
          //                         ),
          //                         child: Image(
          //                           image: NetworkImage(
          //                             currentProduct.imagesURL![0],
          //                           ),
          //                           fit: BoxFit.contain,
          //                         ),
          //                       ),
          //                     ),
          //                     CommonFunctions.blankSpace(height * 0.005, 0),
          //                     Text(
          //                       currentProduct.name!,
          //                       maxLines: 2,
          //                       style: textTheme.labelLarge,
          //                     )
          //                   ],
          //                 ),
          //               );
          //             });
          //       }
          //       if (snapshot.hasError) {
          //         return Container(
          //           height: height * 0.15,
          //           width: width,
          //           alignment: Alignment.center,
          //           child: Text(
          //             'Opps! There was an Error',
          //             style: textTheme.bodyMedium,
          //           ),
          //         );
          //       } else {
          //         return Container(
          //           height: height * 0.15,
          //           width: width,
          //           alignment: Alignment.center,
          //           child: Text(
          //             'Opps! No Product Found',
          //             style: textTheme.bodyMedium,
          //           ),
          //         );
          //       }
          //     }),
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
          horizontal: width * 0.04, vertical: height * 0.01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Buy Again',
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See all',
                style: textTheme.bodySmall!.copyWith(
                  color: blue,
                ),
              ),
            ],
          ),
          // CommonFunctions.blankSpace(
          //   height * 0.02,
          //   0,
          // ),
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
                        border: Border.all(
                          color: greyShade3,
                        ),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    );
                  }))
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
    return StreamBuilder<List<String>>(
        // stream: UsersProductService.fetchOrders(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Container(
                height: height * 0.2,
                width: width,
                alignment: Alignment.center,
                child: Text(
                  'Opps! Your didnt order anything yet',
                  style: textTheme.displayMedium,
                ),
              );
            } else {
              // List<UserProductModel> orders = snapshot.data!;
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04, vertical: height * 0.01),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Orders',
                          style: textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'See all',
                          style: textTheme.bodySmall!.copyWith(
                            color: blue,
                          ),
                        ),
                      ],
                    ),
                    CommonFunctions.blankSpace(
                      height * 0.02,
                      0,
                    ),
                    SizedBox(
                        height: height * 0.17,
                        child: ListView.builder(
                            // itemCount: orders.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const PageScrollPhysics(),
                            itemBuilder: (context, index) {
                              // UserProductModel currentProduct = orders[index];
                              // return InkWell(
                              //   onTap: () {
                              //     ProductModel product = ProductModel(
                              //         imagesURL: currentProduct.imagesURL,
                              //         name: currentProduct.name,
                              //         category: currentProduct.category,
                              //         description: currentProduct.description,
                              //         brandName: currentProduct.brandName,
                              //         manufacturerName:
                              //         currentProduct.manufacturerName,
                              //         countryOfOrigin:
                              //         currentProduct.countryOfOrigin,
                              //         specifications:
                              //         currentProduct.specifications,
                              //         price: currentProduct.price,
                              //         discountedPrice:
                              //         currentProduct.discountedPrice,
                              //         productID: currentProduct.productID,
                              //         productSellerID:
                              //         currentProduct.productSellerID,
                              //         inStock: currentProduct.inStock,
                              //         uploadedAt: currentProduct.time,
                              //         discountPercentage:
                              //         currentProduct.discountPercentage);
                              //
                              //     // Navigator.push(
                              //     //   context,
                              //     //   PageTransition(
                              //     //     child:
                              //     //     ProductScreen(productModel: product),
                              //     //     type: PageTransitionType.rightToLeft,
                              //     //   ),
                              //     // );
                              //   },
                              //   child: Container(
                              //     width: width * 0.4,
                              //     height: height * 0.17,
                              //     padding: const EdgeInsets.all(5),
                              //     margin: EdgeInsets.symmetric(
                              //         horizontal: width * 0.02),
                              //     decoration: BoxDecoration(
                              //       border: Border.all(
                              //         color: greyShade3,
                              //       ),
                              //       borderRadius: BorderRadius.circular(
                              //         10,
                              //       ),
                              //     ),
                              //     child: Image(
                              //       image: NetworkImage(
                              //           currentProduct.imagesURL![0]),
                              //       fit: BoxFit.contain,
                              //     ),
                              //   ),
                              // );
                            }))
                  ],
                ),
              );
            }
          }
          if (snapshot.hasError) {
            return Container(
              height: height * 0.2,
              width: width,
              alignment: Alignment.center,
              child: Text(
                'Opps! There Was An error',
                style: textTheme.displayMedium,
              ),
            );
          } else {
            return Container(
              height: height * 0.2,
              width: width,
              alignment: Alignment.center,
              child: Text(
                'Opps! No Order Found',
                style: textTheme.displayMedium,
              ),
            );
          }
        }, stream: null,);

    // return

    //
  }
}

class YouGridBtons extends StatelessWidget {
  const YouGridBtons({
    super.key,
    required this.width,
    required this.textTheme,
  });

  final double width;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3.4),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // if (index == 0) {
            //   Navigator.push(
            //     context,
            //     PageTransition(
            //       child: const OrdersScreen(),
            //       type: PageTransitionType.rightToLeft,
            //     ),
            //   );
            // }
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: grey,
              ),
              borderRadius: BorderRadius.circular(
                50,
              ),
              color: greyShade2,
            ),
            alignment: Alignment.center,
            child: Builder(builder: (context) {
              if (index == 0) {
                return Text(
                  'Your Orders',
                  style: textTheme.bodyMedium,
                );
              }
              if (index == 1) {
                return Text(
                  'Buy Again',
                  style: textTheme.bodyMedium,
                );
              }
              if (index == 2) {
                return Text(
                  'Your Account',
                  style: textTheme.bodyMedium,
                );
              }
              return Text(
                'Your Wish List',
                style: textTheme.bodyMedium,
              );
            }),
          ),
        );
      },
    );
  }
}
