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
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: Size(width*1,height*1),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: appBarGradientColor,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),

      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width*0.03,
                vertical: height*0.05,
              ),
              height: height*0.06,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: addressBarGradientColor,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width*0.08,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color:grey,
                          ),

                        ),
                      ),

                    ),
                  ),
                  IconButton(
                    onPressed: (){

                    },
                    icon: Icon(
                      Icons.mic,
                      color:black,
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}
