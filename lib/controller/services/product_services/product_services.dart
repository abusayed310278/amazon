import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:amazon/constants/common_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../constants/constants.dart';
import 'package:amazon/model/product_model.dart';
import '../../../model/user_product_model.dart';
import '../../provider/product_provider/product_provider.dart';

class ProductServices {
  static Future getImages({required BuildContext context}) async {
    List<File> selectedImages = [];
    final pickedFile = await picker.pickMultiImage(imageQuality: 100);
    List<XFile> filePick = pickedFile;

    if (filePick.isNotEmpty) {
      for (var i = 0; i < filePick.length; i++) {
        selectedImages.add(File(filePick[i].path));
      }
    } else {
      CommonFunctions.showToast(context: context, message: 'No Image Selected');
    }
    log('The Images are \n${selectedImages.toList().toString()}');
    return selectedImages;
  }

  static Stream<List<UserProductModel>> fetchSalesPerProduct({
    required String productID,
  }) => firestore
      .collection('productSaleData')
      .doc(productID)
      .collection('purchase_history')
      .snapshots()
      .map(
        (snapshot) => snapshot.docs.map((doc) {
          return UserProductModel.fromMap(doc.data());
        }).toList(),
      );

  static const String cloudName = "dg32lbfu5";
  static const String uploadPreset = "amazon";

  /// Upload multiple images to Cloudinary
  static Future<List<String>> uploadImageToFirebaseStorage({
    required List<File> images,
    required BuildContext context,
  }) async {
    List<String> uploadedUrls = [];

    for (File image in images) {
      try {
        String uploadUrl =
            "https://api.cloudinary.com/v1_1/$cloudName/image/upload";

        var request = http.MultipartRequest("POST", Uri.parse(uploadUrl))
          ..fields['upload_preset'] = uploadPreset
          ..files.add(await http.MultipartFile.fromPath('file', image.path));

        var response = await request.send();

        if (response.statusCode == 200) {
          var responseData = await http.Response.fromStream(response);
          var jsonData = json.decode(responseData.body);
          uploadedUrls.add(jsonData['secure_url']);
        } else {
          log("Upload failed: ${response.statusCode}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to upload image: ${image.path}')),
          );
        }
      } catch (e) {
        log("Error uploading image: $e");
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error uploading image: $e')));
      }
    }

    log(uploadedUrls.toString());
    // return uploadedUrls;
    context.read<SellerProductProvider>().updateProductImagesURL(
      imageURLs: uploadedUrls,
    );

    return uploadedUrls;
  }

  static Future addProduct({
    required BuildContext context,
    required ProductModel productModel,
  }) async {
    try {
      await firestore
          .collection('Products')
          .doc(productModel.productID)
          .set(productModel.toMap())
          .whenComplete(() {
            log('Data Added');
            context.read<SellerProductProvider>().fecthSellerProducts();

            Navigator.pop(context);

            CommonFunctions.showToast(
              context: context,
              message: 'Product Added Successful',
            );
          });
    } catch (e) {
      log(e.toString());
      CommonFunctions.showToast(context: context, message: e.toString());
    }
  }

  static Future<List<ProductModel>> getSellersProducts() async {
    List<ProductModel> sellersProducts = [];

    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Products')
          .orderBy('uploadedAt', descending: true)
          .where('productSellerID', isEqualTo: auth.currentUser!.phoneNumber)
          .get();

      snapshot.docs.forEach((element) {
        sellersProducts.add(ProductModel.fromMap(element.data()));
      });
      log(sellersProducts.toList().toString());
    } catch (e) {
      log('error Found');
      log(e.toString());
    }
    log(sellersProducts.toList().toString());
    return sellersProducts;
  }
}
