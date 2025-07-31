import 'package:amazon/utils/theme.dart';
import 'package:amazon/view/auth_screens.dart';
import 'package:amazon/view/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main()async {
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

      ],
      child: MaterialApp(
          theme:theme,
          home:OTPScreen(
            mobileNumber: '+91101010101010',
          ),
          // home:AuthScreen(),
          debugShowCheckedModeBanner: false,
      ),
    );
  }
}


