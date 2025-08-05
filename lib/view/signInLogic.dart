import 'dart:developer';

import 'package:amazon/controller/services/auth_services/auth_services.dart';
import 'package:amazon/controller/services/user_data_crud_services/user_data_CRUD_services.dart';
import 'package:amazon/view/auth_screens.dart';
import 'package:amazon/view/user/home/home_screen.dart';
import 'package:amazon/view/user/user_data_screen/user_data_input_screen.dart';
import 'package:amazon/view/user/user_persistant_nav_bar/user_persistant_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignInLogic extends StatefulWidget {
  const SignInLogic({super.key});

  @override
  State<SignInLogic> createState() => _SignInLogicState();
}

class _SignInLogicState extends State<SignInLogic> {

  checkUser() async {
    bool userAlreadyThere = await UserDataCRUD.checkUser();

    // final userAlreadyThere = await userDataCRUD.checkUser();

    // if (userAlreadyThere == null) {
    //   // Handle the case where the function returns null.
    //   // For example, you might want to print a debug message or show an error.
    //   print("User check returned null. User may not exist or there was an error.");
    //   return; // or handle the error appropriately
    // }

    log(userAlreadyThere.toString());

    if (userAlreadyThere==true) {
      Navigator.push(
        context,
        PageTransition(
          child: UserBottomNavBar(),
          type: PageTransitionType.rightToLeft,
        ),
      );
    }else{
      Navigator.push(
        context,
        PageTransition(
          child: const UserDataInputScreen(),
          type: PageTransitionType.rightToLeft,
        ),
      );
    }


  }

  checkAuthentication() {
    bool userIsAuthenticated = AuthServices.checkAuthentication();

    userIsAuthenticated
        ? checkUser()
        : Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
              child: const AuthScreen(),
              type: PageTransitionType.rightToLeft,
            ),
            (route) => false,
          );
  }

  @override
  void initState() {
    super.initState();
    // Delay navigation to ensure context is ready
    Future.delayed(Duration.zero, () {
      checkAuthentication();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        image: AssetImage('assets/images/amazon_splash_screen.png'),
        fit: BoxFit.fill,
      ),
    );
  }
}
