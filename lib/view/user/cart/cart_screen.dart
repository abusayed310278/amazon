import 'dart:developer';

import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/controller/services/users_product_services/users_product_services.dart';
import 'package:amazon/view/user/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../model/user_product_model.dart';
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
                StreamBuilder(
                  stream: UsersProductService.fetchCartProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          'Opps! No Product Added To Cart',
                          style: textTheme.bodyMedium,
                        ),
                      );
                    }
                    if (snapshot.hasData) {
                      List<UserProductModel> cartProducts = snapshot.data!;
                      log(cartProducts.length.toString());
                      return Column(
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
                                  text:
                                      '\$ ${cartProducts.fold(0.0, (previousValue, product) => previousValue + (product.productCount! * product.discountedPrice!)).toStringAsFixed(0)}',
                                  style: textTheme.displaySmall!.copyWith(
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
                                CommonFunctions.blankSpace(0, width * 0.01),
                                Expanded(
                                  child: Column(
                                    children: [
                                      RichText(
                                        textAlign: TextAlign.justify,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  'Your Order is eligible for FREE Delivery. ',
                                              style: textTheme.bodySmall!
                                                  .copyWith(color: teal),
                                            ),
                                            TextSpan(
                                              text:
                                                  'Select this option at checkout.',
                                              style: textTheme.bodySmall,
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
                          ElevatedButton(
                            onPressed: () async {

                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: amber,
                              minimumSize: Size(width, height * 0.06),
                            ),
                            child: Text(
                              'Proceed to Buy',
                              style: textTheme.bodyMedium,
                            ),
                          ),
                          CommonFunctions.blankSpace(height * 0.02, 0),
                          CommonFunctions.divider(),
                          CommonFunctions.blankSpace(height * 0.02, 0),
                          ListView.builder(
                            itemCount: cartProducts.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              UserProductModel currenProduct =
                                  cartProducts[index];
                              return Container(
                                // height: height * 0.2,
                                width: width,
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02,
                                  vertical: height * 0.01,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: height * 0.01,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: greyShade1,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image(
                                            image: NetworkImage(
                                              currenProduct.imagesURL![0],
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                          CommonFunctions.blankSpace(
                                            height * 0.01,
                                            0,
                                          ),
                                          Container(
                                            height: height * 0.06,
                                            width: width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: greyShade3,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: InkWell(
                                                    onTap: () async {
                                                      if (currenProduct
                                                              .productCount ==
                                                          1) {
                                                        await UsersProductService.removeProductfromCart(
                                                          productId:
                                                              currenProduct
                                                                  .productID!,
                                                          context: context,
                                                        );
                                                      }
                                                      await UsersProductService.updateCountCartProduct(
                                                        productId: currenProduct
                                                            .productID!,
                                                        newCount:
                                                            currenProduct
                                                                .productCount! -
                                                            1,
                                                        context: context,
                                                      );
                                                    },
                                                    child: Container(
                                                      height: double.infinity,
                                                      width: double.infinity,
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
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                    color: white,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      currenProduct.productCount
                                                          .toString(),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: InkWell(
                                                    onTap: () async {
                                                      await UsersProductService.updateCountCartProduct(
                                                        productId: currenProduct
                                                            .productID!,
                                                        newCount:
                                                            currenProduct
                                                                .productCount! +
                                                            1,
                                                        context: context,
                                                      );
                                                    },
                                                    child: Container(
                                                      height: double.infinity,
                                                      width: double.infinity,
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
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    CommonFunctions.blankSpace(0, width * 0.02),
                                    Expanded(
                                      flex: 7,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            currenProduct.name!,
                                            maxLines: 3,
                                            style: textTheme.bodyMedium,
                                          ),
                                          CommonFunctions.blankSpace(
                                            height * 0.01,
                                            0,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '\$ ${currenProduct.discountedPrice!.toStringAsFixed(0)}',
                                                style: textTheme.displayMedium!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                              Text(
                                                '\tMRP: \$',
                                                style: textTheme.bodySmall!
                                                    .copyWith(color: grey),
                                              ),
                                              Text(
                                                ' ${currenProduct.price!.toStringAsFixed(0)}',
                                                style: textTheme.bodySmall!
                                                    .copyWith(
                                                      color: grey,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          CommonFunctions.blankSpace(
                                            height * 0.005,
                                            0,
                                          ),
                                          Text(
                                            currenProduct.discountedPrice! > 499
                                                ? 'Eligible for Free Shipping'
                                                : 'Extra Delivery Charges Applied',
                                            style: textTheme.bodySmall!
                                                .copyWith(color: grey),
                                          ),
                                          CommonFunctions.blankSpace(
                                            height * 0.005,
                                            0,
                                          ),
                                          Text(
                                            'In Stock',
                                            style: textTheme.bodySmall!
                                                .copyWith(color: teal),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () async {
                                                  await UsersProductService.removeProductfromCart(
                                                    productId: currenProduct
                                                        .productID!,
                                                    context: context,
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: white,
                                                  side: BorderSide(
                                                    color: greyShade3,
                                                  ),
                                                ),
                                                child: Text(
                                                  'Delete',
                                                  style: textTheme.bodySmall,
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: white,
                                                  side: BorderSide(
                                                    color: greyShade3,
                                                  ),
                                                ),
                                                child: Text(
                                                  'Save for Later',
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
                      );
                    }
                    if (snapshot.hasError) {
                      return const Text('Opps! Error Found');
                    } else {
                      return const Text('Opps! No Product Added To Cart');
                    }
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
