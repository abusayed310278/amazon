import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({super.key, required this.mobileNumber});

  String mobileNumber;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: Image(
          image: const AssetImage('assets/images/amazon_logo.png'),
          height: height * 0.04,
          width: width,
        ),
      ),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Authentication Required.',
                style: textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              CommonFunctions.blankSpace(height * 0.01, 0),

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.mobileNumber,

                      style: textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' Change',
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),

              CommonFunctions.blankSpace(height * 0.01, 0),

              Text(
                  "We have sent a One Time Password (OTP) to the mobile number above. Please enter it to complete verification",
                  style: textTheme.bodyMedium,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
