// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/constants/constants.dart';
import 'package:amazon/controller/services/product_services/product_services.dart';
import 'package:amazon/controller/services/users_product_services/users_product_services.dart';
import 'package:amazon/model/user_product_model.dart';
import 'package:amazon/view/user/home/home_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:uuid/uuid.dart';
import '../../../controller/provider/rating_provider/rating_provider.dart';
import '../../../model/product_model.dart';
import '../../../utils/colors.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key, required this.productModel});

  ProductModel productModel;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController reviewTextController = TextEditingController();
  double usersRating = -1;

  // ! RAZORPAY CODES (Payment Gateway)
  final razorpay = Razorpay();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
      context.read<RatingProvider>().reset();
      setState(() {
        usersRating = -1;
      });
      context
          .read<RatingProvider>()
          .checkUserRating(productID: widget.productModel.productID!);
      context
          .read<RatingProvider>()
          .checkProductPurchase(productID: widget.productModel.productID!);
    });
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    UserProductModel userProductModel = UserProductModel(
      imagesURL: widget.productModel.imagesURL,
      name: widget.productModel.name,
      category: widget.productModel.category,
      description: widget.productModel.description,
      brandName: widget.productModel.brandName,
      manufacturerName: widget.productModel.manufacturerName,
      countryOfOrigin: widget.productModel.countryOfOrigin,
      specifications: widget.productModel.specifications,
      price: widget.productModel.price,
      discountedPrice: widget.productModel.discountedPrice,
      productID: widget.productModel.productID,
      productSellerID: widget.productModel.productSellerID,
      inStock: widget.productModel.inStock,
      discountPercentage: widget.productModel.discountPercentage,
      productCount: 1,
      time: DateTime.now(),
    );
    await ProductServices.addSalesData(
      context: context,
      productModel: userProductModel,
      userID: auth.currentUser!.phoneNumber!,
    );
    await UsersProductService.addOrder(
        context: context, productModel: userProductModel);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    CommonFunctions.showErrorToast(
      context: context,
      message: 'Opps! Product Purchase Failed',
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {}

  executePayment() {
    var options = {
      'key': keyID,
      // 'amount': widget.productModel.discountedPrice! * 100,
      'amount': 1 * 100, // Amount is rs 1,
      // here amount * 100 because razorpay counts amount in paisa
      //i.e 100 paisa = 1 Rupee
      // 'image' : '<YOUR BUISNESS EMAIL>'
      'name': widget.productModel.name,
      'description': (widget.productModel.description!.length < 255)
          ? widget.productModel.description!.length
          : widget.productModel.description!.substring(0, 250),
      'prefill': {
        'contact': auth.currentUser!.phoneNumber, //<USERS CONTACT NO.>
        'email': 'test@razorpay.com' // <USERS EMAIL NO.>
      }
    };

    razorpay.open(options);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: PreferredSize(

        preferredSize: Size(width, height * 0.1),
        child: HomePageAppBar(width: width, height: height),
      ),
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.01,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: height * 0.23,
                  autoPlay: true,
                  viewportFraction: 1,
                ),
                items: widget.productModel.imagesURL!.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,

                        // margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          // color: Colors.amber,
                          image: DecorationImage(
                            image: NetworkImage(i),
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),

              CommonFunctions.blankSpace(height * 0.02, 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Brand: ${widget.productModel.brandName}',
                    style: textTheme.labelMedium!.copyWith(color: teal),
                  ),

                  Row(
                    children: [
                      Text(
                        '0.0',
                        style: textTheme.labelMedium!.copyWith(color: teal),
                      ),
                      CommonFunctions.blankSpace(0, width * 0.01),
                      RatingBar(
                        initialRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: width * 0.04,
                        ignoreGestures: true,
                        ratingWidget: RatingWidget(
                          full: Icon(Icons.star, color: amber),
                          half: Icon(Icons.star_half, color: amber),
                          empty: Icon(Icons.star_outline_sharp, color: amber),
                        ),
                        itemPadding: EdgeInsets.zero,
                        onRatingUpdate: (rating) {},
                      ),
                      CommonFunctions.blankSpace(0, width * 0.02),
                      Text('(0)', style: textTheme.labelMedium),
                    ],
                  ),
                ],
              ),
              CommonFunctions.blankSpace(height * 0.02, 0),
              Text(
                widget.productModel.name!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: textTheme.labelMedium,
              ),
              CommonFunctions.blankSpace(height * 0.01, 0),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '-${widget.productModel.discountPercentage}%',
                      style: textTheme.displayLarge!.copyWith(
                        color: red,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text:
                          '\t\$${widget.productModel.price!.toStringAsFixed(0)}',
                      style: textTheme.displayLarge!.copyWith(
                        color: black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'M.R.P: ₹ ${widget.productModel.price}',
                style: textTheme.labelMedium!.copyWith(
                  color: grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              CommonFunctions.blankSpace(height * 0.02, 0),

              ElevatedButton(
                onPressed: () async {
                  UserProductModel model = UserProductModel(
                    imagesURL: widget.productModel.imagesURL,
                    name: widget.productModel.name,
                    category: widget.productModel.category,
                    description: widget.productModel.description,
                    brandName: widget.productModel.brandName,
                    manufacturerName: widget.productModel.manufacturerName,
                    countryOfOrigin: widget.productModel.countryOfOrigin,
                    specifications: widget.productModel.specifications,
                    price: widget.productModel.price,
                    discountedPrice: widget.productModel.discountedPrice,
                    productID: widget.productModel.productID,
                    productSellerID: widget.productModel.productSellerID,
                    inStock: widget.productModel.inStock,
                    discountPercentage: widget.productModel.discountPercentage,
                    productCount: 1,
                    time: DateTime.now(),
                  );
                  await UsersProductService.addProductToCart(
                    context: context,
                    productModel: model,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: amber,
                  minimumSize: Size(width, height * 0.06),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'Add to Cart',
                  style: textTheme.bodyMedium!.copyWith(color: black),
                ),
              ),
              CommonFunctions.blankSpace(height * 0.01, 0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: orange,
                  minimumSize: Size(width, height * 0.06),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'Buy Now',
                  style: textTheme.bodyMedium!.copyWith(color: black),
                ),
              ),
              CommonFunctions.blankSpace(height * 0.02, 0),
              CommonFunctions.divider(),
              CommonFunctions.blankSpace(height * 0.01, 0),
              Text(
                'Features',
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              CommonFunctions.blankSpace(height * 0.005, 0),
              Text(
                widget.productModel.description!,
                style: textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: grey,
                ),
              ),
              CommonFunctions.blankSpace(height * 0.02, 0),
              CommonFunctions.divider(),
              CommonFunctions.blankSpace(height * 0.01, 0),
              Text(
                'Specification',
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              CommonFunctions.blankSpace(height * 0.005, 0),
              Text(
                widget.productModel.specifications!,
                style: textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: grey,
                ),
              ),
              CommonFunctions.blankSpace(height * 0.02, 0),
              CommonFunctions.divider(),
              CommonFunctions.blankSpace(height * 0.02, 0),

              Text(
                'Product Image Gallery',
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              CommonFunctions.blankSpace(height * 0.01, 0),
              ListView.builder(
                itemCount: widget.productModel.imagesURL!.length,
                shrinkWrap: true,
                physics: const PageScrollPhysics(),
                itemBuilder: (context, index) {
                  return Image(
                    image: NetworkImage(widget.productModel.imagesURL![index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
