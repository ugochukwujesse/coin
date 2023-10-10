import 'package:crypto_app/screen/home_screen.dart';
import 'package:crypto_app/utility/app_colour.dart';
import 'package:crypto_app/utility/app_gif.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context)=>const HomeScreen()),);
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColour.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                SvgPicture.asset(AppGif.splash,
                  height: 200,
                  width: 200,
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
