import 'package:crypto_app/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Crypto());
}
class Crypto extends StatelessWidget {
  const Crypto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
