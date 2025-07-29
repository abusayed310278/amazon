import 'package:amazon/view/auth_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:AuthScreen(),
        debugShowCheckedModeBanner: false,
    );
  }
}
