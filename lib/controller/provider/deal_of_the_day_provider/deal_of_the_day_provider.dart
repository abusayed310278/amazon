import 'package:flutter/cupertino.dart';

import '../../../model/product_model.dart';
import '../../services/users_product_services/users_product_services.dart';

class DealOfTheDayProvider extends ChangeNotifier{
  List<ProductModel> deals = [];
  bool dealsFetched = false;

  fetchTodaysDeal() async {
    deals = [];
    deals = await UsersProductService.featchDealOfTheDay();
    dealsFetched = true;
    notifyListeners();
  }
}