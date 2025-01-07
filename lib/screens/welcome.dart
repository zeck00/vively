import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vively/screens/login.dart';
import 'package:vively/services/colors.dart';
import 'package:vively/services/fonts.dart';
import 'package:vively/services/size_config.dart';
import 'package:vively/widgets/button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isArabic = context.locale == const Locale('ar');

    initSizeConfig(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(Icons.language_rounded, color: AppColors.black),
          onPressed: () => context.locale == const Locale('en')
              ? context.setLocale(const Locale('ar'))
              : context.setLocale(const Locale('en')),
        ),
      ),
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: Container()),
            Text(
              'welcome.hiPhrase'.tr(),
              style: Fonts.headline1(context),
            ),
            Text(
              'welcome.introMessage'.tr(),
              style: Fonts.bodyText1(context),
            ),
            SizedBox(height: propHeight(40)),
            Image.asset(
              isArabic
                  ? 'assets/images/arCard.png'
                  : 'assets/images/enCard.png',
              width: propWidth(320),
              height: propHeight(320),
            ),
            SizedBox(height: propHeight(110)),
            CustomButton(
              w: 300,
              h: 40,
              text: 'login.loginButton'.tr(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              gradient: const LinearGradient(
                colors: [
                  AppColors.blue,
                  AppColors.lavender,
                ],
                transform: GradientRotation(-90),
              ),
            ),
            SizedBox(height: propHeight(70)),
            Expanded(child: Container())
          ],
        ),
      ),
    );
  }
}
