
import 'dart:io';

import 'package:flutter/material.dart';

class SellerProductProvider extends ChangeNotifier{

  List<File>productImages=[];
  List<String>productImagesURL=[];
  List<ProductModel>products=[];
  bool sellerProductsFetched=false;

}