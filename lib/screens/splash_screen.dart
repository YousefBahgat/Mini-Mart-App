import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'product_list_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: EasySplashScreen(
          logo: Image.asset('assets/cart_icon.png'),
          title: Text(
            'MiniMart',
            style: GoogleFonts.ubuntuCondensed(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFF32565c),
          showLoader: true,
          loadingText: Text('Loading...',
              style: GoogleFonts.ubuntuCondensed(fontSize: 24)),
          navigator: const ProductListScreen(),
          durationInSeconds: 3,
        ),
      ),
    );
  }
}
