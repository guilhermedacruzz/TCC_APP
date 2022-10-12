import 'package:flutter/material.dart';
import 'package:tcc/misc/colors.dart';
import 'package:tcc/pages/background.dart';
import 'package:tcc/widgets/app_large_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcc/widgets/app_text.dart';

import '../widgets/main_button.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLargeText(
              text: "WELCOME TO EDU",
              size: 16,
            ),
            SizedBox(height: size.height * 0.06),
            SvgPicture.asset(
              "icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.03),
            MainButton(
              text: "Login",
              color: AppColors.mainColor,
              textColor: Colors.white,
              press: (){},
            ),
            SizedBox(height: size.height * 0.03),
            MainButton(
              text: "Login",
              color: AppColors.mainColor.withOpacity(0.2),
              textColor: Colors.black,
              press: (){},
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
