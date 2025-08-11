import 'package:amazon/model/product_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../home/home_screen.dart';


class ProductScreen extends StatefulWidget {
   ProductScreen({super.key,required this.productModel});

  ProductModel productModel;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size(width, height * 0.1),
        child: HomePageAppBar(
          width: width,
          height: height,
        ),
      ),

        body: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),

          child: SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: height * 0.23,
                    autoPlay: true,
                    viewportFraction: 1,
                  ),
                  items: widget.productModel.imagesURL!.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          // margin: EdgeInsets.symmetric(horizontal: 5.0),

                          decoration: BoxDecoration(
                            // color: Colors.amber,
                            image: DecorationImage(
                              image: NetworkImage(i),
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ],

            ),
          ),
        ),

    );
  }
}
