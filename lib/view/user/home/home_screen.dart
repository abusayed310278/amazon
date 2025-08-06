import 'dart:developer';
import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/constants/constants.dart';
import 'package:amazon/controller/provider/address_provider.dart';
import 'package:amazon/controller/services/user_data_crud_services/user_data_CRUD_services.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../../../model/address_model.dart';
import '../../../utils/colors.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../address_screen/address_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselSliderController todayDealsCarouselController =
      CarouselSliderController();

  checkUserAddress()async{
    bool userAddressPresent=await UserDataCRUD.checkUsersAddress();
    log('user Address Present :${userAddressPresent.toString()}');
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    if (userAddressPresent == false) {
      showModalBottomSheet(
          backgroundColor: transparent,
          context: context,
          builder: (context) {
            return Container(
              height: height * 0.3,
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.03, horizontal: width * 0.03),
              width: width,
              decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Address',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.15,
                    child: ListView.builder(
                        itemCount: 1,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if (index == 0) {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    child: const AddressScreen(),
                                    type: PageTransitionType.rightToLeft,
                                  ),
                                );
                              }
                            },
                            child: Container(
                              width: width * 0.35,
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03,
                                  vertical: height * 0.01),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: greyShade3,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Builder(builder: (context) {
                                if (index == 0) {
                                  return Text(
                                    'Add Address',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: greyShade3),
                                  );
                                }
                                return Text(
                                  'Add Address',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: greyShade3),
                                );
                              }),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
          });
    }


  }

  headphoneDeals(int index) {
    switch (index) {
      case 0:
        return 'Bose';
      case 1:
        return 'boat';
      case 2:
        return 'Sony';
      case 3:
        return 'OnePlus';
    }
  }

  clothingDeals(int index) {
    switch (index) {
      case 0:
        return 'Kurtas,sarees & more';

      case 1:
        return 'Tops,dresses & more';
      case 2:
        return 'T-shirts,jeans & more';
      case 3:
        return 'View all';
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkUserAddress();
      context.read<AddressProvider>().getCurrentSelectedAddress();
    });
  }

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
              HomeScreenUserAddressBar(height: height, width: width),

              CommonFunctions.divider(),

              HomeScreenCategoriesList(
                height: height,
                width: width,
                textTheme: textTheme,
              ),
              CommonFunctions.blankSpace(height * 0.01, 0),
              CommonFunctions.divider(),
              HomeScreenBanner(height: height),
              CommonFunctions.divider(),
              TodaysDealHomeScreenWidget(
                width: width,
                height: height,
                textTheme: textTheme,
                todayDealsCarouselController: todayDealsCarouselController,
              ),
              CommonFunctions.divider(),
              OtherOfferGridWidget(
                // width,
                // height,
                // textTheme,
                title: 'Latest launches in Headphones',
                textBtnName: 'Explore More',
                productPicNamesList: headphonesDeals,
                offerFor: 'headphones',
              ),

              Container(
                height: height * 0.35,
                width: width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/offersNsponcered/insurance.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              CommonFunctions.divider(),
              OtherOfferGridWidget(
                title: 'Minimum 70% off | Top Offers on Clothing',
                textBtnName: 'See all deals',
                productPicNamesList: clothingDealsList,
                offerFor: 'clothing',
              ),

              CommonFunctions.blankSpace(height * 0.01, 0),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  CommonFunctions.blankSpace(height*0.01, 0),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width*0.03,
                    ),
                    child: Text(
                      'Watch Sixer only on miniTv',
                      style: textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),

                    ),
                  ),
                  Container(
                    height: height*0.4,
                    width: width,

                    padding: EdgeInsets.symmetric(
                      horizontal: width*0.03,
                      vertical: height*0.01,
                    ),
                    child: Image(
                      image: AssetImage(
                        'assets/images/offersNsponcered/sixer.png',

                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container OtherOfferGridWidget({
    // required double width,
    // required double height,
    // required TextTheme textTheme,
    required String title,
    required String textBtnName,
    required List<String> productPicNamesList,
    required String offerFor,
  }) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.01,
      ),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          CommonFunctions.blankSpace(height * 0.01, 0),

          productPicNamesList.isEmpty
              ? Center(child: Text("No headphone launches available"))
              : GridView.builder(
                  // The gridDelegate defines the layout of the grid.
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Sets 2 columns in the grid.
                    crossAxisSpacing: 10.0, // Space between columns.
                    mainAxisSpacing: 20.0, // Space between rows.
                    childAspectRatio: 1.0,
                  ),
                  itemCount: productPicNamesList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // border: Border.all(color: greyShade3),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/offersNsponcered/${productPicNamesList[index]}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 5), // Optional spacing

                          // Text(
                          //   headphonesDeals[index].split('.').first, // ✅ correct
                          //   style: textTheme.bodyMedium,
                          // ),
                          Text(
                            offerFor == 'headphones'
                                ? headphoneDeals(index)
                                : clothingDeals(index),
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    );
                  },
                ),

          TextButton(
            onPressed: () {},
            child: Text(
              textBtnName,
              style: textTheme.bodySmall!.copyWith(color: blue),
            ),
          ),


        ],
      ),
    );
  }
}

class TodaysDealHomeScreenWidget extends StatelessWidget {
  const TodaysDealHomeScreenWidget({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
    required this.todayDealsCarouselController,
  });

  final double width;
  final double height;
  final TextTheme textTheme;
  final CarouselSliderController todayDealsCarouselController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '50%-80% off | Latest deals.',
              style: textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            CarouselSlider(
              carouselController: todayDealsCarouselController,
              options: CarouselOptions(
                height: height * 0.23,
                autoPlay: true,
                viewportFraction: 1,
              ),
              items: todaysDeals.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        image: DecorationImage(
                          image: AssetImage('assets/images/todays_deals/$i'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            CommonFunctions.blankSpace(height * 0.01, 0),
            Row(
              children: [
                Container(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: red,
                    ),
                    child: Text(
                      'Upto 62% off',
                      style: textTheme.labelMedium!.copyWith(color: white),
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(0, width * 0.03),
                Text(
                  'Deal of the Day',
                  style: textTheme.labelMedium!.copyWith(
                    color: red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            CommonFunctions.blankSpace(height * 0.01, 0),

            GridView.builder(
              // The gridDelegate defines the layout of the grid.
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Sets 2 columns in the grid.
                crossAxisSpacing: 10.0, // Space between columns.
                mainAxisSpacing: 20.0, // Space between rows.
                childAspectRatio: 1.0,
              ),
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    log(index.toString());
                    todayDealsCarouselController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: greyShade3),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/todays_deals/${todaysDeals[index]}',
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            ),

            CommonFunctions.blankSpace(height * 0.01, 0),

            TextButton(
              onPressed: () {},
              child: Text(
                'See all Deals',
                style: textTheme.bodySmall!.copyWith(color: blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenBanner extends StatelessWidget {
  const HomeScreenBanner({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height * 0.23,
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
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class HomeScreenCategoriesList extends StatelessWidget {
  const HomeScreenCategoriesList({
    super.key,
    required this.height,
    required this.width,
    required this.textTheme,
  });

  final double height;
  final double width;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}

class HomeScreenUserAddressBar extends StatelessWidget {
  const HomeScreenUserAddressBar({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: height * 0.06,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: addressBarGradientColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child:
      Consumer<AddressProvider>(builder: (context, addressProvider, child) {
        if (addressProvider.fetchedCurrentSelectedAddress && addressProvider.addressPresent) {
          AddressModel selectedAddress = addressProvider.currentSelectedAddress;
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_pin,
                color: black,
              ),
              CommonFunctions.blankSpace(
                0,
                width * 0.02,
              ),
              Text(
                'Deliver to ${selectedAddress.name} - ${selectedAddress.town}, ${selectedAddress.state}',
                style: textTheme.bodySmall,
              )
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_pin,
                color: black,
              ),
              CommonFunctions.blankSpace(
                0,
                width * 0.02,
              ),
              Text('Deliver to user - City, State', style: textTheme.bodySmall)
            ],
          );
        }
      }),

    );
  }
}

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({super.key, required this.width, required this.height});

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
                contentPadding: EdgeInsets.symmetric(horizontal: width * 0.03),
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
