import 'package:flutter/material.dart';
import 'package:real_estateui/onBorading_screen1.dart';

import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
  class Pageview extends StatelessWidget {
    const Pageview({super.key});
  
    @override
    Widget build(BuildContext context) {
      final List<Widget> pages=[


      ];
      final PageController  pageController = PageController();
      return PageView(
        controller: pageController,
        children: [

        ],
      );
    }
  }
  


