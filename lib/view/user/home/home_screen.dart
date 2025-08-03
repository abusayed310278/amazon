import 'dart:developer';
import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/constants/constants.dart';
import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

import 'package:carousel_slider/carousel_slider.dart';

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
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.08),
          child: HomePageAppBar(width: width, height: height),
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

              Divider(thickness: 2, color: grey, height: 0),

              SizedBox(
                height: height * 0.09,
                width: width,
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: AssetImage(
                              'assets/images/categories/${categories[index]}.png',
                            ),
                            height: height * 0.06,
                          ),
                          Text(
                            categories[index],
                            style: textTheme.labelMedium,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis, // Handle long text
                            maxLines: 1, // Prevent vertical overflow
                          ),
                        ],
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              CommonFunctions.blankSpace(height * 0.01, 0),
              Divider(thickness: 3, color: greyShade3, height: 0),

              SizedBox(
                height: height * 0.3,
                width: width,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: height*0.23,
                    autoPlay: true,
                    viewportFraction: 1,
                  ),
                  items: carouselPictures.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              image: DecorationImage(
                                image: AssetImage('assets/images/carousel_slideshow/$i'),
                                fit:BoxFit.cover,
                              ),
                          ),

                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
