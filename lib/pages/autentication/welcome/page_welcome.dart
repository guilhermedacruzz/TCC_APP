import 'package:flutter/material.dart';
import 'package:tcc/pages/autentication/welcome/page_welcome_backgrounsd_images.dart';
import 'package:tcc/pages/autentication/welcome/page_welcome_data.dart';
import 'package:tcc/pages/page_splash.dart';
import 'package:tcc/widgets/forms/custom_button.dart';

class PageWelcome extends StatefulWidget {
  static String routeName = "/welcome";

  const PageWelcome({super.key});

  @override
  State<PageWelcome> createState() => _PageWelcomeState();
}

class _PageWelcomeState extends State<PageWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: pageWelcomeData.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            padding: const EdgeInsets.only(top: 120, right: 20, left: 20),
            child: PageWelcomeBackgroundImage(
              src: pageWelcomeData[index]["src"],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pageWelcomeData[index]["title"],
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        pageWelcomeData[index]["subtitle"],
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 250,
                        child: Text(
                          pageWelcomeData[index]["text"],
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: (index == pageWelcomeData.length - 1)
                            ? SizedBox(
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
                              )
                            : const Icon(
                                Icons.arrow_downward,
                                size: 35,
                              ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ...List.generate(
                        pageWelcomeData.length,
                        (indexDots) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: (indexDots == index) ? 25 : 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: (indexDots == index)
                                  ? Theme.of(context).indicatorColor
                                  : Theme.of(context)
                                      .indicatorColor
                                      .withOpacity(0.5),
                            ),
                          );
                        },
                      ),
                    ],
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
