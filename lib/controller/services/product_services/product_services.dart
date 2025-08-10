

import 'dart:developer';
import 'dart:io';

import 'package:amazon/constants/common_functions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../constants/constants.dart';
import '../../../model/product_model.dart';
import '../../provider/product_provider/product_provider.dart';

class ProductServices{

  static Future getImages({required BuildContext context}) async {
    List<File> selectedImages = [];
    final pickedFile = await picker.pickMultiImage(
      imageQuality: 100,
    );
    List<XFile> filePick = pickedFile;

    if (filePick.isNotEmpty) {
      for (var i = 0; i < filePick.length; i++) {
        selectedImages.add(File(filePick[i].path));
      }
    } else {
      CommonFunctions.showToast(
          context: context, message: 'No Image Selected');
    }
    log('The Images are \n${selectedImages.toList().toString()}');
    return selectedImages;
  }

  static uploadImageToFirebaseStorage({
    required List<File> images,
    required BuildContext context,
  }) async {
    List<String> imagesURL = [];
    String sellerUID = auth.currentUser!.phoneNumber!;
    Uuid uuid = const Uuid();

    await Future.forEach(images, (image) async {
      String imageName = '$sellerUID${uuid.v1().toString()}';
      Reference ref = storage.ref().child('Product_Images').child(imageName);
      await ref.putFile(File(image.path));
      String imageURL = await ref.getDownloadURL();
      imagesURL.add(imageURL);
    });

    // context
    //     .read<ProductProvider>()
    //     .updateProductImagesURL(imageURLs: imagesURL);
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

         // context.read<ProductProvider>().fecthSellerProducts();
        Navigator.pop(context);

        CommonFunctions.showToast(
            context: context, message: 'Product Added Successful');
      });
    } catch (e) {
      log(e.toString());
      CommonFunctions.showToast(context: context, message: e.toString());
    }
  }


}