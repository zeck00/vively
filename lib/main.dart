import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:vively/services/size_config.dart';
import 'screens/login.dart';
import 'services/colors.dart';
import 'services/fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/locales',
      fallbackLocale: const Locale('en'),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    initSizeConfig(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppThemes.lightTheme(context),
      darkTheme: AppThemes.darkTheme(context),
      themeMode: ThemeMode.system,
      home: const LoginScreen(),
    );
  }
}

class AppThemes {
  // Light Theme
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.blue,
      canvasColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.white,
      cardColor: AppColors.white,
      appBarTheme: AppBarTheme(
        color: AppColors.blue,
        elevation: 0,
        titleTextStyle:
            Fonts.headline1(context).copyWith(color: AppColors.white),
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      textTheme: TextTheme(
        bodyMedium: Fonts.bodyText1(context),
        bodySmall: Fonts.caption(context),
        headlineMedium: Fonts.headline1(context),
        headlineSmall: Fonts.sectionTitle(context),
        labelLarge: Fonts.buttonText(context),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.teal,
        foregroundColor: AppColors.white,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.teal,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  // Dark Theme
  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.blue,
      canvasColor: AppColors.black,
      scaffoldBackgroundColor: AppColors.black,
      cardColor: AppColors.black,
      appBarTheme: AppBarTheme(
        color: AppColors.blue,
        elevation: 0,
        titleTextStyle:
            Fonts.headline1(context).copyWith(color: AppColors.white),
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      textTheme: TextTheme(
        bodyMedium: Fonts.bodyText1(context).copyWith(color: AppColors.white),
        bodySmall: Fonts.caption(context).copyWith(color: AppColors.white),
        headlineMedium:
            Fonts.headline1(context).copyWith(color: AppColors.mint),
        headlineSmall:
            Fonts.sectionTitle(context).copyWith(color: AppColors.mint),
        labelLarge: Fonts.buttonText(context),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.mint,
        foregroundColor: AppColors.white,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.mint,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
