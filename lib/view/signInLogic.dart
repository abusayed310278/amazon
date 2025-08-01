import 'package:amazon/controller/services/auth_services/auth_services.dart';
import 'package:amazon/view/auth_screens.dart';
import 'package:amazon/view/user/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignInLogic extends StatefulWidget {
  const SignInLogic({super.key});

  @override
  State<SignInLogic> createState() => _SignInLogicState();
}

class _SignInLogicState extends State<SignInLogic> {

  // checkUser() async {
  //   bool userAlreadyThere = await UserDataCRUD.checkUser();
  //   // log(userAlreadyThere.toString());
  //   if (userAlreadyThere == true) {
  //     bool userIsSeller = await UserDataCRUD.userIsSeller();
  //     log('start');
  //     log(userIsSeller.toString());
  //     if (userIsSeller == true) {
  //       Navigator.push(
  //         context,
  //         PageTransition(
  //           child: const SellerBottomNavBar(),
  //           type: PageTransitionType.rightToLeft,
  //         ),
  //       );
  //     } else {
  //       Navigator.push(
  //         context,
  //         PageTransition(
  //           child: const UserBottomNavBar(),
  //           type: PageTransitionType.rightToLeft,
  //         ),
  //       );
  //     }
  //   } else {
  //     Navigator.push(
  //       context,
  //       PageTransition(
  //         child: const UserDataInputScrren(),
  //         type: PageTransitionType.rightToLeft,
  //       ),
  //     );
  //   }
  // }


  checkAuthentication() {
    bool userIsAuthenticated = AuthServices.checkAuthentication();

    userIsAuthenticated ?
    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
            child: const AuthScreen(),
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
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        image: AssetImage('assets/images/amazon_splash_screen.png'),
        fit: BoxFit.fill,
      ),
    );
  }
}
