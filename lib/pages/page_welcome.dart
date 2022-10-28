import 'package:flutter/material.dart';
import 'package:tcc/pages/page_splash.dart';
import '../forms/custom_button.dart';

class PageWelcome extends StatefulWidget {
  static String routeName = "/welcome";
  const PageWelcome({super.key});

  @override
  State<PageWelcome> createState() => _PageWelcomeState();
}

class _PageWelcomeState extends State<PageWelcome> {
  List images = [
    "assets/images/welcome/1.jpg",
    "assets/images/welcome/2.jpg",
    "assets/images/welcome/3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
            padding: const EdgeInsets.only(top: 120, right: 20, left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Trips",
                      style: Theme.of(context).textTheme.headline4!.merge(
                            const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                    ),
                    Text(
                      "Trips",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 250,
                      child: Text(
                        "Mountain hikes give you an incredible sense of freedom along with endurance tests",
                        style: Theme.of(context).textTheme.bodyText1!.merge(
                              const TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ...List.generate(
                      images.length,
                      (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: (indexDots == index) ? 25 : 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: (indexDots == index)
                                  ? Colors.white
                                  : Colors.white54),
                        );
                      },
                    ),
                    const Spacer(),
                    if (index == images.length - 1)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 120,
                              height: 45,
                              child: CustomButton(
                                widget: Text(
                                  "Começar",
                                  style: Theme.of(context).textTheme.button,
                                ),
                                onAction: () {
                                  Navigator.of(context)
                                      .pushNamed(PageSplash.routeName);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
