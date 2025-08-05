import 'package:amazon/controller/services/auth_services/auth_services.dart';
import 'package:amazon/view/auth_screens.dart';
import 'package:amazon/view/user/home/home_screen.dart';
import 'package:amazon/view/user/user_persistant_nav_bar/user_persistant_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignInLogic extends StatefulWidget {
  const SignInLogic({super.key});

  @override
  State<SignInLogic> createState() => _SignInLogicState();
}

class _SignInLogicState extends State<SignInLogic> {





  checkAuthentication() {
    bool userIsAuthenticated = AuthServices.checkAuthentication();

    userIsAuthenticated ?
    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
            child: const UserBottomNavBar(),
            type: PageTransitionType.rightToLeft),
            (route) => false)
        :
    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
            child: const AuthScreen(),
            type: PageTransitionType.rightToLeft),
                (route) => false);

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
    return const Placeholder();
  }
}
