import 'package:flutter/material.dart';
import 'package:real_estateui/constants/images.dart';
import 'package:real_estateui/screenutil.dart';
class OnboradingScreen1 extends StatelessWidget {
  const OnboradingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final screenUtil=Dynamicscreenutil(context);
    return Scaffold(backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: screenUtil.sizewidth(1) ,
              height: screenUtil.sizehieght(0.4) ,
              decoration: BoxDecoration(
                image:  DecorationImage(image: AssetImage(ImagePaths.Appartment),
                  fit: BoxFit.fill
                ),
              ),
            ),
            SizedBox(height: 25),
            // Title
            Text(
              'Lorem Ipsum is simply\n dummy text printing',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),


          ],

        ),
      ),
    );
  }
}
