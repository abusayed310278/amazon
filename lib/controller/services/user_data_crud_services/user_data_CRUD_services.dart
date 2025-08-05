import 'dart:developer';

import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:amazon/model/user_model.dart';

class UserDataCRUD{

  static addNewUser({required UserModel userModel,required BuildContext context,})async{
    try{
      await firestore
          .collection('users')
          .doc(auth.currentUser!.phoneNumber)
          .set(userModel.toJson())
          .whenComplete((){
            log('Data Added');

            CommonFunctions.showToast(context: context, message: 'User Added Successfully.');
          });
    }catch(e){

      log(e.toString());
      CommonFunctions.showToast(context: context, message: e.toString());


    }
  }

  static Future checkUser()async{
    try{
      await firestore
          .collection('users')
          .where('mobileNum',isEqualTo: auth.currentUser!.phoneNumber)
          .get()
          .then((value)=>value.size>0?true:false);
    }catch(e){
      log(e.toString());
    }
  }

}