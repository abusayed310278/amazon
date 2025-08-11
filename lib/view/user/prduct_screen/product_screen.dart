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
import 'package:uuid/uuid.dart';
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



  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;


    return Scaffold(
      appBar: PreferredSize(

        preferredSize: Size(width, height * 0.1),
        child: HomePageAppBar(
          width: width,
          height: height,
        ),
      ),
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              CommonFunctions.blankSpace(
                height * 0.02,
                0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Brand: ${widget.productModel.brandName}',
                    style: textTheme.labelMedium!.copyWith(color: teal),
                  ),

                ],
              ),
              CommonFunctions.blankSpace(
                height * 0.02,
                0,
              ),
              Text(
                widget.productModel.name!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: textTheme.labelMedium,
              ),
              CommonFunctions.blankSpace(
                height * 0.01,
                0,
              ),
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
                      '\t\t₹ ${widget.productModel.price!.toStringAsFixed(0)}',
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
                    color: grey, decoration: TextDecoration.lineThrough),
              ),
              CommonFunctions.blankSpace(
                height * 0.02,
                0,
              ),
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
                      context: context, productModel: model);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: amber,
                  minimumSize: Size(
                    width,
                    height * 0.06,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                  ),
                ),
                child: Text(
                  'Add to Cart',
                  style: textTheme.bodyMedium!.copyWith(color: black),
                ),
              ),
              CommonFunctions.blankSpace(
                height * 0.01,
                0,
              ),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: orange,
                  minimumSize: Size(
                    width,
                    height * 0.06,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                  ),
                ),
                child: Text(
                  'Buy Now',
                  style: textTheme.bodyMedium!.copyWith(color: black),
                ),
              ),
              CommonFunctions.blankSpace(
                height * 0.02,
                0,
              ),
              CommonFunctions.divider(),
              CommonFunctions.blankSpace(
                height * 0.01,
                0,
              ),
              Text(
                'Features',
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              CommonFunctions.blankSpace(
                height * 0.005,
                0,
              ),
              Text(
                widget.productModel.description!,
                style: textTheme.labelMedium!
                    .copyWith(fontWeight: FontWeight.w400, color: grey),
              ),
              CommonFunctions.blankSpace(
                height * 0.02,
                0,
              ),
              CommonFunctions.divider(),
              CommonFunctions.blankSpace(
                height * 0.01,
                0,
              ),
              Text(
                'Specification',
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              CommonFunctions.blankSpace(
                height * 0.005,
                0,
              ),
              Text(
                widget.productModel.specifications!,
                style: textTheme.labelMedium!
                    .copyWith(fontWeight: FontWeight.w400, color: grey),
              ),
              CommonFunctions.blankSpace(
                height * 0.02,
                0,
              ),
              CommonFunctions.divider(),
              CommonFunctions.blankSpace(
                height * 0.02,
                0,
              ),

              Text(
                'Product Image Gallery',
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              CommonFunctions.blankSpace(
                height * 0.01,
                0,
              ),
              ListView.builder(
                  itemCount: widget.productModel.imagesURL!.length,
                  shrinkWrap: true,
                  physics: const PageScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Image(
                      image: NetworkImage(
                        widget.productModel.imagesURL![index],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }


}
