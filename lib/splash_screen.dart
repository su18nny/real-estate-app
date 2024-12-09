import 'package:flutter/material.dart';
import 'package:real_estateui/constants/images.dart';
import 'package:real_estateui/onBorading_screen1.dart';
import 'package:real_estateui/screenutil.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final screenUtil= Dynamicscreenutil(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: screenUtil.sizewidth(1) ,
            height: screenUtil.sizehieght(0.7) ,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage(ImagePaths.startImage),
                  fit: BoxFit.fitWidth
              ),
            ),
          ),
          Column(
            children: [
              Container(
                width: screenUtil.sizewidth(0.8),
                height:screenUtil.sizehieght(0.1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(ImagePaths.gharForSale),
                    scale: 0.10,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 38,left: 10),
                child: SizedBox(height: 52,width: 335,
                  child: ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OnboradingScreen1(),));

                  }, child:Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 20,letterSpacing: 4),),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black87,shadowColor: Colors.white,elevation: 10),
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
