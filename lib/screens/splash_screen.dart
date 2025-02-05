// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:work_lah/screens/bottombar/bottom_bar_screen.dart';
import 'package:work_lah/utility/colors.dart';
import 'package:work_lah/utility/image_path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_lah/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      // checkOnboardingState();
      checkLoginStatus();
    });
  }

  void checkLoginStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // Check if an authentication token exists
      String? authToken = prefs.getString('auth_token'); // Replace with your key
      if (authToken != null && authToken.isNotEmpty) {
        // Navigate to the home screen if the user is logged in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomBarScreen(index: 0)),
        );
      } else {
        // Navigate to the login screen if not logged in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    } catch (e) {
      print('Error checking login status: $e');
      // Optional: Show an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Image.asset(
          ImagePath.appLogo,
        ),
      ),
    );
  }
}