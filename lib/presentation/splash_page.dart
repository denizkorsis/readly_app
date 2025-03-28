import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
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
  double _scale = 1; // Başlangıç ölçeğ

  @override
  void initState() {
    super.initState();

    // 3 saniye sonunda animasyonlu bir geçişle ana sayfaya yönlendirme yap
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MainScreen(),
        ),
      );
    });

    // Zoom animasyonunu başlat
    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        _scale = 1;
      });
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
            'assets/images/gif.gif',
            height: 842.h,
            width: 480.w,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
