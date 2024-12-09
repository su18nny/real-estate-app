import 'package:flutter/material.dart';
import 'package:real_estateui/screenutil.dart';
import 'constants/images.dart';
class OnboradingScreen1 extends StatefulWidget {
  const OnboradingScreen1({super.key});
  @override
  State<OnboradingScreen1> createState() => _OnboradingScreen1State();
}
class _OnboradingScreen1State extends State<OnboradingScreen1> {
  final PageController _pageController = PageController();
  int curruntPage = 0;
  @override
  Widget build(BuildContext context) {

    print("this ----->${curruntPage}");
    final screenUtil = Dynamicscreenutil(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    curruntPage = index;
                  });
                },
                children: [
                  Column(
                    children: [
                      Container(
                        width: screenUtil.sizewidth(1),
                        height: screenUtil.sizehieght(0.4),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(ImagePaths.Appartment),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Lorem Ipsum is simply',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: ' dummy text printing',
                              style: TextStyle(
                                color: Colors.blue,
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
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: screenUtil.sizewidth(1),
                        height: screenUtil.sizehieght(0.4),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(ImagePaths.Location),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Lorem Ipsum is simply ',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: ' dummy text printing',
                              style: TextStyle(
                                color: Colors.blue,
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
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: screenUtil.sizewidth(1),
                        height: screenUtil.sizehieght(0.4),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(ImagePaths.Task),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Lorem Ipsum is simply',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: ' dummy text printing',
                              style: TextStyle(
                                color: Colors.blue,
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
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
               Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35,left:175),
                    child: Row(
                      children: List.generate(3, (index) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          height: 10,
                          width: curruntPage == index ? 20 : 10,
                          decoration: BoxDecoration(
                            color: curruntPage == index ? Colors.blue : Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        );
                      }),
                    ),
                  ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                // if(curruntPage==0){
                                //
                                // }else if(curruntPage==1){
                                //   _pageController.jumpToPage(0);
                                // }else if(curruntPage==2){
                                //   _pageController.jumpToPage(1);
                                // } Code:- Frpm Praveen Sir.


                                if (curruntPage > 0) {
                                  _pageController.previousPage(
                                    duration:  Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                } else {
                                }
                              },
                              child: Icon(Icons.arrow_back),
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: CircleBorder(side: BorderSide(width: 0.1)),
                            ),

                            FloatingActionButton(
                              onPressed: () {
                                if (curruntPage < 2) {
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                } else {
                                }
                              },
                              child: Icon(Icons.arrow_forward),
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: CircleBorder(side: BorderSide(width: 0.1)),

                            ),
                          ],

                        ),
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 25),
                        child: TextButton(
                          onPressed: () {
                            _pageController.jumpToPage(2);
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),


                ],
              ),

          ],
        ),
      ),
    );
  }
}
