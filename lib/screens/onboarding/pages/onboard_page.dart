import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/utils/colors.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({super.key, required this.lottieAsset, required this.title, required this.subtitle});

  final String lottieAsset;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.06,),

          /// Animation
          Container(
              // width: width * 0.8,
            height: height * 0.48,
              // color: Colors.orange,
              child: Lottie.asset(lottieAsset)),

          SizedBox(
            height: height * 0.04,
          ),

          /// Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Styles.titleStyle
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 06,
          ),

          /// Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: width * 0.7,
                    child: Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: Styles.subTitleStyle,
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
