import 'package:flutter/material.dart';
import 'package:real_estateui/screenutil.dart';
import 'constants/images.dart';
class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

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
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Lorem ',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Ipsum is simply',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(
                    text: '\n dummy text printing',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 220),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 25),
                        child: TextButton(onPressed: () {
                        }, child: Text("Skip",style: TextStyle(color: Colors.blue,fontSize: 15),)),
                      ),
                      FloatingActionButton(onPressed: () {
                      },child: Icon(Icons.arrow_forward),backgroundColor: Colors.blue,),

                    ],

                  ),
                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}
