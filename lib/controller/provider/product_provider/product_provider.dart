
import 'dart:io';

import 'package:amazon/controller/services/product_services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../model/product_model.dart';

class SellerProductProvider extends ChangeNotifier{

  List<File>productImages=[];
  List<String>productImagesURL=[];
  List<ProductModel> products = [];
  bool sellerProductsFetched = false;

  fetchProductImagesFromGallery({required BuildContext context})async{
    productImages=await ProductServices.getImages(context: context);
    notifyListeners();
  }

  // uploadProductImagesToFirebaseStorage({required BuildContext context})async{
  //   productImagesURL=await ProductServices.uploadImageToFirebaseStorage(
  //       images: productImages,
  //       context: context,
  //   );
  //   notifyListeners();
  // }

  Future<void> pickAndUploadImages(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      productImages = pickedFiles.map((file) => File(file.path)).toList();

      productImagesURL = await ProductServices.uploadImageToFirebaseStorage(
        images: productImages,
        context: context,
      );

      notifyListeners();
    }
  }


  fecthSellerProducts() async {
    products = await ProductServices.getSellersProducts();
    sellerProductsFetched = true;
    notifyListeners();
  }





}

























