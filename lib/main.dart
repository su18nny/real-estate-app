import 'package:flutter/material.dart';

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

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
            Container(
              width: screenWidth * 1,
              height: screenHeight * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/images/Group 1436.jpg"),

                  fit: BoxFit.fitWidth
                ),
              ),
            ),
          Column(
            children: [
              Container(
                width: screenWidth*0.8,
                height:screenHeight*0.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage("assets/images/Layer_1.jpg"),
                    scale: 0.10,
                  ),
                ),
              ),


            ],
          ),
        ],
      ),
    );
  }
}
