import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/controller/services/user_data_crud_services/user_data_CRUD_services.dart';
import 'package:amazon/model/user_model.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../utils/colors.dart';


class UserDataInputScreen extends StatefulWidget {
  const UserDataInputScreen({super.key});

  @override
  State<UserDataInputScreen> createState() => _UserDataInputScreenState();
}

class _UserDataInputScreenState extends State<UserDataInputScreen> {

  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      phoneController.text = auth.currentUser!.phoneNumber ?? '';
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
          preferredSize: Size(width, height * 0.08),
          child: Container(
            padding: EdgeInsets.only(
              left: width * 0.03,
              right: height * 0.03,
              bottom: height*0.012,
              top:height*0.045
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: appBarGradientColor,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image:const AssetImage('assets/images/amazon_logo.png',),
                  height: height * 0.04,
                ),
      
              ],
            ),
          ),
        ),
        body: Container(

        ),
      ),

    );
  }
}
