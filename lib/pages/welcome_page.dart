import 'package:flutter/material.dart';
import 'package:tcc/misc/colors.dart';
import 'package:tcc/widgets/app_large_text.dart';
import 'package:tcc/widgets/app_text.dart';
import 'package:tcc/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "img/welcome-one.png",
    "img/welcome-two.png",
    "img/welcome-three.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    images[index],
                  ),
                  fit: BoxFit.cover),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Trips"),
                      AppText(
                        text: "Mountain",
                        size: 30,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 250,
                        child: AppText(
                          text:
                              "Mountain hikes give you an incredible sense of freedom along with endurance tests",
                          color: AppColors.textColor2,
                          size: 14,
                        ),
                      ),
                      const SizedBox(height: 40),
                      ResponsiveButton(
                        width: 120,
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(
                      images.length,
                      (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: (indexDots == index) ? 25:8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: (indexDots == index) ? AppColors.mainColor:AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
