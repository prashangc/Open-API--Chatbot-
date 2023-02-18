import 'dart:async';
import 'package:chat_gpt_app/imports/imports.dart';
import 'package:chat_gpt_app/screens/mainPage/MainHomePage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => go(
        context,
        const MainHomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBlack,
        child: Center(
          child: FlutterLogo(
            size: maxHeight(context) / 2,
          ),
        ),
      ),
    );
  }
}
