import 'package:flutter/material.dart';
import 'package:real_estateui/constants/images.dart';
import 'package:real_estateui/screenutil.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
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
                    currentPage = index;
                  });
                },
                children: [
                  buildPage(
                    screenUtil,
                    ImagePaths.Appartment,
                    'Lorem Ipsum is simply',
                    'dummy text printing',
                    'Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.',
                  ),
                  buildPage(
                    screenUtil,
                    ImagePaths.Location,
                    'Lorem Ipsum is simply',
                    'dummy text printing',
                    'Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.',
                  ),
                  buildPage(
                    screenUtil,
                    ImagePaths.Task,
                    'Lorem Ipsum is simply',
                    'dummy text printing',
                    'Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        height: 10,
                        width: currentPage == index ? 20 : 10,
                        decoration: BoxDecoration(
                          color: currentPage == index ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      );
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        child: TextButton(
                          onPressed: () {
                            // Skip functionality: Go to last page or another screen
                            _pageController.jumpToPage(2);
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        child: FloatingActionButton(
                          onPressed: () {
                            if (currentPage < 2) {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              // Navigate to next screen
                            }
                          },
                          child: Icon(Icons.arrow_forward),
                          backgroundColor: Colors.blue,
                        ),
                      ),
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
  Widget buildPage(Dynamicscreenutil screenUtil, String imagePath, String titlePart1, String titlePart2, String description) {
    return Column(
      children: [
        Container(
          width: screenUtil.sizewidth(1),
          height: screenUtil.sizehieght(0.4),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 25),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: titlePart1,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: ' $titlePart2',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
