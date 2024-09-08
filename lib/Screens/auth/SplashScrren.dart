// ignore_for_file: non_constant_identifier_names

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'login_otp_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logoWidth: 15.w,
      logo: Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.cover,
      ),
      title: Text(
        "اهلا وسهلا في مطعم حاشي باشا",
        style: GoogleFonts.playfairDisplay(fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.amber[200]
            //Color(0xFFFBC02D)
            ),
      ),
      backgroundColor: Colors.black,
      showLoader: true,
      loaderColor: const Color(0xFFFBC02D),
      loadingText: const Text(
        "جاري التحميل ...",
        style: TextStyle(color: Color(0xFFFBC02D)),
      ),
      navigator: const Login_OTP_Screen(),
      durationInSeconds: 3,
    );
  }
}
