import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:readly/core/constants/asset_constants/image_paths.dart';
import 'package:readly/presentation/language_page.dart';
import 'package:readly/presentation/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double _scale = 1;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MainScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedScale(
          scale: _scale,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: Image.asset(
            ImagePaths.gif,
            height: 842.h,
            width: 480.w,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
