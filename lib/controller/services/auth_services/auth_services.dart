import 'dart:developer';
import 'package:amazon/controller/provider/auth_provider.dart';
import 'package:amazon/view/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AuthServices {
  static Future<void> receiveOTP({
    required BuildContext context,
    required String mobileNo,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: '+88$mobileNo', // Make sure to use proper country code
        verificationCompleted: (PhoneAuthCredential credential) {
          log('Verification completed: $credential');
        },
        verificationFailed: (FirebaseAuthException exception) {
          log('Verification failed: ${exception.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          // 🔁 Store verificationId in Provider
          context.read<AuthProvider>().updateVerificationId(verificationId);

          Navigator.push(
            context,
            PageTransition(
              child: OTPScreen(mobileNumber: mobileNo),

            type: PageTransitionType.rightToLeft,
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          log('Code auto retrieval timeout');
        },
      );
    } catch (e) {
      log('Error: $e');
    }
  }

  static Future<void> verifyOTP({
    required BuildContext context,
    required String otp,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      final verificationId = context.read<AuthProvider>().verificationId;

      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      await auth.signInWithCredential(credential);
    } catch (e) {
      log('Error verifying OTP: $e');
    }
  }
}
