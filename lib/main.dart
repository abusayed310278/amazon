
import 'package:amazon/controller/provider/auth_provider.dart';
import 'package:amazon/firebase_options.dart';
import 'package:amazon/model/product_model.dart';
import 'package:amazon/utils/theme.dart';
import 'package:amazon/view/auth_screens.dart';
import 'package:amazon/view/otp_screen.dart';
import 'package:amazon/view/seller/add_product_screen/add_products_screen.dart';
import 'package:amazon/view/seller/inventory/inventory_screen.dart';
import 'package:amazon/view/seller/seller_persistant_nav_bar/seller_persistant_nav_bar.dart';
import 'package:amazon/view/signInLogic.dart';
import 'package:amazon/view/user/address_screen/address_screen.dart';
import 'package:amazon/view/user/cart/cart_screen.dart';
import 'package:amazon/view/user/home/home_screen.dart';
import 'package:amazon/view/user/menu/menu_screen.dart';
import 'package:amazon/view/user/prduct_screen/product_screen.dart';
import 'package:amazon/view/user/profile/profile_screen.dart';
import 'package:amazon/view/user/user_data_screen/user_data_input_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controller/provider/address_provider.dart';
import 'controller/provider/product_provider/product_provider.dart';
import 'controller/provider/users_product_provider/users_product_provider.dart';
import 'firebase_options.dart';

Future main()async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Amazon());

}

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  @override
  Widget build(BuildContext context) {

    ProductModel productModel = ProductModel();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<AddressProvider>(create: (_) => AddressProvider()),
        ChangeNotifierProvider<SellerProductProvider>(create: (_) => SellerProductProvider()),
        ChangeNotifierProvider<UsersProductProvider>(create: (_) => UsersProductProvider()),

      ],
      child: MaterialApp(
          theme:theme,
          // home:OTPScreen(
          //   mobileNumber: '+91101010101010',
          // ),
          // home:const AuthScreen(),
          // home: const UserDataInputScreen(),
          // home: const InventoryScreen(),
          // home: const AddressScreen(),
          // home:  SellerBottomNavBar(),
          // home:  InventoryScreen(),
          home:  const SignInLogic(),
          // home:  AddProductScreen(),
          // home:  HomeScreen(),
          // home:  ProductScreen(productModel: productModel),

          debugShowCheckedModeBanner: true,
      ),
    );
  }
}


