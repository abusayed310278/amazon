import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/utils/colors.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool inLogin = true;
  String currentCountryCode = '+88';
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image(
          image: AssetImage('assets/images/amazon_logo.png'),
          height: height * 0.04,
          width: width,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                  'Welcome',
                  style: textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),

                Builder(
                  builder: (context) {
                    if (inLogin) {
                      return SignIn(width, height, textTheme, context);
                    }
                    return CreateAccount(width, height, textTheme, context);
                  },
                ),

                CommonFunctions.blankSpace(height * 0.05, 0),
                BottomAuthScreenWidget(
                  width: width,
                  height: height,
                  textTheme: textTheme,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container CreateAccount(
    double width,
    double height,
    TextTheme textTheme,
    BuildContext context,
  ) {
    return Container(
      width: width,
      decoration: BoxDecoration(border: Border.all(color: greyShade3)),
      child: Column(
        children: [
          // Create Account Option
          // Container(
          //   height: height * 0.06,
          //   width: width,
          //   decoration: BoxDecoration(
          //     border: Border(bottom: BorderSide(color: greyShade3)),
          //     color: greyShade1,
          //   ),
          //   padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          //   child: Row(
          //     children: [
          //       InkWell(
          //         onTap: () {
          //           setState(() {
          //             inLogin = false;
          //           });
          //         },
          //         child: Container(
          //           height: height * 0.03,
          //           width: height * 0.03,
          //           decoration: BoxDecoration(
          //             shape: BoxShape.circle,
          //             border: Border.all(color: grey),
          //             color: white,
          //           ),
          //           alignment: Alignment.center,
          //           child: Icon(
          //             Icons.circle,
          //             size: height * 0.015,
          //             color: inLogin ? transparent : secondaryColor,
          //           ),
          //         ),
          //       ),
          //       CommonFunctions.blankSpace(0, width * 0.02),
          //       RichText(
          //         text: TextSpan(
          //           children: [
          //             TextSpan(
          //               text: 'Create Account. ',
          //               style: textTheme.bodyMedium!.copyWith(
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //             TextSpan(
          //               text: 'New to Amazon?',
          //               style: textTheme.bodyMedium,
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Sign In Option and Input Fields
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.01,
            ),
            child: Column(
              children: [
                // Sign In Option
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          inLogin = false;
                        });
                      },
                      child: Container(
                        height: height * 0.03,
                        width: height * 0.03,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: grey),
                          color: white,
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.circle,
                          size: height * 0.015,
                          color: inLogin ? transparent : secondaryColor,
                        ),
                      ),
                    ),
                    CommonFunctions.blankSpace(0, width * 0.02),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Create Account. ',
                            style: textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'New to Amazon?',
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height * 0.01, 0),

                SizedBox(
                  height: height * 0.06,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'First and last name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: secondaryColor),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 0,
                      ),
                    ),
                  ),
                ),

                CommonFunctions.blankSpace(height * 0.01, 0),

                // Phone Input Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          onSelect: (val) {
                            setState(() {
                              currentCountryCode = '+${val.phoneCode}';
                            });
                          },
                        );
                      },
                      child: Container(
                        height: height * 0.05,
                        width: width * 0.2,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: grey),
                          color: greyShade2,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          currentCountryCode,
                          style: textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    CommonFunctions.blankSpace(0, width * 0.05),
                    Expanded(
                      child: SizedBox(
                        height: height * 0.06,
                        width: width * 0.2,
                        child: TextFormField(
                          controller: mobileController,
                          cursorColor: Colors.black,
                          style: textTheme.bodySmall,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Enter mobile number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: secondaryColor),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: grey),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                CommonFunctions.blankSpace(height * 0.02, 0),

                Text(
                  "By enrolling your mobile phone number, you consent to receive automated security notifications via text message from Amazon. Message and data rates may apply.",
                  style: textTheme.bodyMedium,
                ),

                CommonFunctions.blankSpace(height * 0.02, 0),

                // ElevatedButton(
                //   onPressed: () {},
                //   style: ElevatedButton.styleFrom(
                //     minimumSize: Size(width * 0.88, height * 0.06),
                //     backgroundColor: Colors.amber,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.zero,
                //     ),
                //   ),
                //   child: Text('Continue', style: textTheme.displaySmall),
                // ),

                CommonAuthButton(title:'Continue',onPressed: (){

                },),

                CommonFunctions.blankSpace(height * 0.02, 0),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By Continuing you agree to Amazon\'s ',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: 'Conditions of use ',
                        style: textTheme.labelMedium!.copyWith(color: blue),
                      ),
                      TextSpan(text: 'and ', style: textTheme.labelMedium),
                      TextSpan(
                        text: 'Privacy Notice ',
                        style: textTheme.labelMedium!.copyWith(color: blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          CommonFunctions.blankSpace(height * 0.05, 0),
          Column(
            children: [
              Container(
                height: 2,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [white, grey, white]),
                ),
              ),
            ],
          ),

          Container(
            height: height * 0.06,
            width: width,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: greyShade3)),
              color: greyShade1,
            ),
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      inLogin = true;
                    });
                  },
                  child: Container(
                    height: height * 0.03,
                    width: height * 0.03,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: grey),
                      color: white,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.circle,
                      size: height * 0.015,
                      color: inLogin ? secondaryColor : transparent,
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(0, width * 0.02),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Sign in. ',
                        style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Already a Customer.',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container SignIn(
    double width,
    double height,
    TextTheme textTheme,
    BuildContext context,
  ) {
    return Container(
      width: width,
      decoration: BoxDecoration(border: Border.all(color: greyShade3)),
      child: Column(
        children: [
          // Create Account Option
          Container(
            height: height * 0.06,
            width: width,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: greyShade3)),
              color: greyShade1,
            ),
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      inLogin = false;
                    });
                  },
                  child: Container(
                    height: height * 0.03,
                    width: height * 0.03,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: grey),
                      color: white,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.circle,
                      size: height * 0.015,
                      color: inLogin ? transparent : secondaryColor,
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(0, width * 0.02),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Create Account. ',
                        style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'New to Amazon?',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Sign In Option and Input Fields
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.01,
            ),
            child: Column(
              children: [
                // Sign In Option
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          inLogin = true;
                        });
                      },
                      child: Container(
                        height: height * 0.03,
                        width: height * 0.03,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: grey),
                          color: white,
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.circle,
                          size: height * 0.015,
                          color: inLogin ? secondaryColor : transparent,
                        ),
                      ),
                    ),
                    CommonFunctions.blankSpace(0, width * 0.02),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Sign in. ',
                            style: textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Already a Customer?',
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height * 0.01, 0),

                // Phone Input Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          onSelect: (val) {
                            setState(() {
                              currentCountryCode = '+${val.phoneCode}';
                            });
                          },
                        );
                      },
                      child: Container(
                        height: height * 0.05,
                        width: width * 0.2,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: grey),
                          color: greyShade2,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          currentCountryCode,
                          style: textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    CommonFunctions.blankSpace(0, width * 0.05),
                    Expanded(
                      child: SizedBox(
                        height: height * 0.06,
                        width: width * 0.2,
                        child: TextFormField(
                          controller: mobileController,
                          cursorColor: Colors.black,
                          style: textTheme.bodySmall,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Enter mobile number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: secondaryColor),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: grey),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                CommonFunctions.blankSpace(height * 0.02, 0),

                CommonAuthButton(title: 'Continue', onPressed: () {}),

                CommonFunctions.blankSpace(height * 0.02, 0),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By Continuing you agree to Amazon\'s ',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: 'Conditions of use ',
                        style: textTheme.labelMedium!.copyWith(color: blue),
                      ),
                      TextSpan(text: 'and ', style: textTheme.labelMedium),
                      TextSpan(
                        text: 'Privacy Notice ',
                        style: textTheme.labelMedium!.copyWith(color: blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          CommonFunctions.blankSpace(height * 0.05, 0),
          Column(
            children: [
              Container(
                height: 2,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [white, grey, white]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CommonAuthButton extends StatelessWidget {
  CommonAuthButton({super.key, required this.title, required this.onPressed});

  String title;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width * 0.88, height * 0.06),
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      child: Text('Continue', style: textTheme.displaySmall),
    );
  }
}

class BottomAuthScreenWidget extends StatelessWidget {
  const BottomAuthScreenWidget({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
  });

  final double width;
  final double height;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [white, white, grey, grey, white, white],
            ),
          ),
        ),
        CommonFunctions.blankSpace(height * 0.02, 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Condition of Use',
              style: textTheme.bodyMedium!.copyWith(color: blue),
            ),
            Text(
              'Privacy Notice',
              style: textTheme.bodyMedium!.copyWith(color: blue),
            ),
            Text('Help', style: textTheme.bodyMedium!.copyWith(color: blue)),
          ],
        ),
        CommonFunctions.blankSpace(height * 0.01, 0),
        Text(
          '@ 1996-2023,Amazon.com,Inc. or its affiliates',
          style: textTheme.labelMedium!.copyWith(color: grey),
        ),
      ],
    );
  }
}
