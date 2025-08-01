import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textThem=Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.08),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.012,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: appBarGradientColor,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Search bar
                SizedBox(
                  width: width * 0.81,
                  child: TextField(
                    onTap: () {
                      log('Redirecting you to search product screen');
                    },
                    cursorColor: black,
                    decoration: InputDecoration(
                      fillColor: white,
                      filled: true,
                      hintText: 'Search Amazon.bd',
                      prefixIcon: Icon(Icons.search, color: black),
                      suffixIcon: Icon(Icons.camera_alt_sharp, color: grey),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey),
                      ),
                    ),
                  ),
                ),

                // Microphone button
                IconButton(
                  onPressed: () {
                    log('Mic tapped');
                  },
                  icon: Icon(Icons.mic, color: black),
                ),
              ],
            ),
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              // Decorative top bar (optional for banners, location, etc.)
              Container(
                height: height * 0.06,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: addressBarGradientColor,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),

              Text(
                'Welcome to Amazon.in',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
