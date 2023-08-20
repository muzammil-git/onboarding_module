import 'package:flutter/material.dart';
import 'package:untitled/screens/onboarding/pages/onboard_page.dart';

import '../../utils/colors.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();

  List<Widget> pages = [
    OnboardingPage(
      lottieAsset: "assets/lottie_1.json",
      title: "We sell book",
      subtitle: "We've worked collecting books that gives you aim in life.",
    ),
    OnboardingPage(
      lottieAsset: "assets/lottie_2.json",
      title: "We make experience",
      subtitle: "We've devoted our time to build your experience fun",
    ),
    OnboardingPage(
      lottieAsset: "assets/lottie_3.json",
      title: "Join & build mindset",
      subtitle: "Our focus is your growth and building unshakable mindset",
    ),
  ];

  var currentIndex = ValueNotifier(0);

  @override
  void dispose() {
    currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    debugPrint("Current Index: ${currentIndex.value}");

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          /// PageView
          PageView(
            controller: controller,
            children: pages,
            onPageChanged: (index) {
              print(index);
              currentIndex.value = index;
            },
          ),

          /// DOT indicator
          ValueListenableBuilder(
            valueListenable: currentIndex,
            builder: (BuildContext context, value, Widget? child) {
              return Positioned(
                bottom: height * 0.158,
                child: Container(
                  // height: height * 0.12,
                  // color: Colors.black45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (index) => DotIndicator(
                        currentPage: value == index,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          /// Button
          ValueListenableBuilder(
              valueListenable: currentIndex,
              builder: (BuildContext context, index, Widget? child) {
                return Positioned(
                  bottom: height * 0.03,
                  child: ElevatedButton(
                    onPressed: () {
                      final nextPage = currentIndex.value + 1;

                      if (nextPage == pages.length) {
                        print("Last");
                        return;
                      }

                      controller.animateToPage(
                        nextPage,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(width * 0.8, 50),
                        foregroundColor: Colors.white,
                        backgroundColor: Styles.buttonColor,
                    ),
                    child: index < pages.length - 1
                        ? Text("Continue")
                        : Text("Get Started"),
                  ),
                );
              }),

          /// SKIP BUTTON
          ValueListenableBuilder(
            valueListenable: currentIndex,
            builder: (BuildContext context, index, Widget? child) {
              return index < pages.length - 1
                  ? Positioned(
                      top: height * 0.06,
                      left: 10,
                      child: TextButton(
                        onPressed: () {
                          controller.jumpToPage(pages.length - 1);
                        },
                        child: Text("SKIP"),
                      ),
                    )
                  : Container();
            },
          ),
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.currentPage});

  final bool currentPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 04),
      height: 07,
      width: currentPage ? 20 : 07,
      decoration: BoxDecoration(
          color: currentPage ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
