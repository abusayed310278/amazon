import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String phoneNumber = '';
  String verificationId = '';
  String otp = '';

  void updatePhoneNumber(String num) {
    phoneNumber = num;
    notifyListeners();
  }

  void updateVerificationId(String verID) {
    verificationId = verID;
    notifyListeners();
  }

  void updateOtp(String code) {
    otp = code;
    notifyListeners();
  }
}
