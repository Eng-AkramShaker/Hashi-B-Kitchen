// ignore_for_file: camel_case_types, unused_element

import 'package:face_auth_flutter/Screens/auth/widget/custom_textField.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/user/hive_user.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/user/lock_screen.dart';
import 'package:face_auth_flutter/data/off_Line_DB/initialized_Hive/int_Hive.dart';
import 'package:face_auth_flutter/data/provider/auth/Login.dart';
import 'package:face_auth_flutter/data/provider/categories_provider/categories.dart';
import 'package:face_auth_flutter/data/provider/invoice_provider/invoice.dart';
import 'package:face_auth_flutter/widgets/Buttons/custom_button.dart';
import 'package:face_auth_flutter/widgets/show_snack/select_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/constants/navigators.dart';
import '../../../../widgets/texts/custom_text.dart';

class Login_OTP_Screen extends StatefulWidget {
  const Login_OTP_Screen({super.key});

  @override
  _Login_OTP_ScreenState createState() => _Login_OTP_ScreenState();
}

class _Login_OTP_ScreenState extends State<Login_OTP_Screen> {
  bool isLodging = false;

  @override
  void initState() {
    super.initState();
    _initializeHiveData();
  }

  Future _initializeHiveData() async {
    Fetch_All_Data_Hive(context: context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer5<Login_Provider, Invoice_Provider, Categories_Provider, Hive_User_Provider, Hive_Lock_Screen_Provider>(
      builder: (context, loginProvider, invoiceProvider, categoryProvider, userHiveProvider, lockScreenHiveProvider, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://i.imgur.com/YRsyiVK.gif'),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 8.h),
                      SizedBox(
                        height: 12.h,
                        child: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
                      ),
                      SizedBox(height: 15.h),
                      SizedBox(
                        width: size.width / 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildLoginButtons(size, loginProvider, userHiveProvider, lockScreenHiveProvider),
                            _buildFaceIdRegistration(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoginButtons(
      Size size, Login_Provider proLogin, Hive_User_Provider userHiveProvider, Hive_Lock_Screen_Provider lockScreenHiveProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Custom_Button(
          context: context,
          title: 'Face ID',
          size_text: 13.sp,
          vertical: 1.8.h,
          horizontal: 3.w,
          backgroundColor: const Color.fromARGB(255, 173, 125, 57),
          Color_text: Colors.white,
          Border_Color: Colors.green,
          onPressed: () {
            //

            // pushNewScreen(context, FaceScanScreen(user: LocalDB.getUser()));
          },
        ),
        SizedBox(height: 15.h),
        Custom_Button(
          context: context,
          // title: 'SR ${pro_Invoice.pay}',
          title: ' Login ',
          size_text: 13.sp,
          vertical: 1.8.h,
          horizontal: 3.w,
          backgroundColor: const Color.fromARGB(255, 173, 125, 57),
          Color_text: Colors.white,
          Border_Color: Colors.green,
          onPressed: () {
            //

            _showLoginDialog(size, proLogin, userHiveProvider, lockScreenHiveProvider);
          },
        ),
      ],
    );
  }

  void _showLoginDialog(
      Size size, Login_Provider proLogin, Hive_User_Provider userHiveProvider, Hive_Lock_Screen_Provider lockScreenHiveProvider) {
    Snack_Select_Menu(
      context: context,
      delete_onPressed: () {
        setState(() {});
        pop(context);
      },
      widget: SizedBox(
        height: 40.h,
        child: Column(
          children: [
            //
            SizedBox(height: 4.h),
            Custom_Text(text: "Login", size: 15.sp, fontweight: FontWeight.bold, color: Colors.black),

            SizedBox(height: 5.h),

            Custom_TextField(
              hintText: 'admin@gmail.com',
              size: size,
              icon: Icons.email,
              title: 'Email',
              onChanged: (value) {
                //

                setState(() {
                  proLogin.email.text = value;
                });
              },
            ),

            SizedBox(height: 2.h),

            Custom_TextField(
              hintText: '123456789',
              size: size,
              icon: Icons.password,
              title: 'Password',
              onChanged: (value) {
                //

                setState(() {
                  proLogin.pass.text = value;
                });
              },
            ),
          ],
        ),
      ),
      onPressed: () async {
        // Hive ----------------------------------------------------------------------
        // lock_Screen_Hive.delete_Lock_Screen();

        // setState(() {
        //   proLogin.email.text = 'Administrator';
        //   proLogin.pass.text = 'JT8r!HKmJX9D';
        // });

        proLogin.Login(context, userHiveProvider, proLogin, lockScreenHiveProvider, proLogin.email.text, proLogin.pass.text);
      },
    );
  }

  Widget _buildFaceIdRegistration() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Custom_Text(text: 'Face ID', size: 14.sp, color: wtColor),
        InkWell(
          onTap: () {
            // Navigate to FaceScanScreen
          },
          child: Custom_Text(text: 'Register', size: 15.sp, color: bluColor),
        ),
      ],
    );
  }
}
