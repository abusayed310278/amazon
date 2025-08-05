import 'dart:developer';

import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:amazon/model/user_model.dart';
import 'package:page_transition/page_transition.dart';

import '../../../view/signInLogic.dart';

class UserDataCRUD {
  static addNewUser({
    required UserModel userModel,
    required BuildContext context,
  }) async {
    try {
      await firestore
          .collection('users')
          .doc(auth.currentUser!.phoneNumber)
          .set(userModel.toJson())
          .whenComplete(() {
            log('Data Added');

            CommonFunctions.showToast(
              context: context,
              message: 'User Added Successfully.',
            );

            Navigator.pushAndRemoveUntil(
              context,
              PageTransition(
                child: const SignInLogic(),
                type: PageTransitionType.rightToLeft,
              ),
              (route) => false,
            );
          });
    } catch (e) {
      log(e.toString());
      CommonFunctions.showToast(context: context, message: e.toString());
    }
  }

  static Future<bool> checkUser() async {
    bool userPresent = false;
    try {
      await firestore
          .collection('users')
          .where('mobileNum', isEqualTo: auth.currentUser!.phoneNumber)
          .get()
          .then((value) => value.size > 0 ? userPresent = true : userPresent = false);
    } catch (e) {
      log(e.toString());
    }
    log(userPresent.toString());
    return userPresent;
  }

}
