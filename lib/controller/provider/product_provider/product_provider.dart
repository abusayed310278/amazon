
import 'dart:io';

import 'package:amazon/controller/services/product_services/product_services.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier{

  List<File>productImages=[];
  List<String>productImagesURL=[];
  bool sellerProductsFetched=false;

  fetchProductImagesFromGallery({required BuildContext context})async{
    productImages=await ProductServices.getImages(context: context);
    notifyListeners();
  }

  uploadProductImagesToFirebaseStorage({required BuildContext context})async{
    productImagesURL=await ProductServices.uploadImageToFirebaseStorage(
        images: productImages,
        context: context,
    );
    notifyListeners();
  }






}

























