import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:vively/services/size_config.dart';
import 'screens/welcome.dart';
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
      home: const WelcomeScreen(),
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
        color: AppColors.white,
        elevation: 0,
        titleTextStyle:
            Fonts.bodyText1(context).copyWith(color: AppColors.black),
        iconTheme: const IconThemeData(color: AppColors.black),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.teal,
          splashFactory: NoSplash.splashFactory,
          overlayColor: AppColors.teal.withOpacity(0.2),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: AppColors.purple.withOpacity(0.2),
        cursorColor: AppColors.blue,
        selectionHandleColor: AppColors.purple,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        hintStyle: Fonts.inputHint(context).copyWith(color: AppColors.black),
        activeIndicatorBorder: const BorderSide(color: AppColors.blue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(propWidth(10)),
          borderSide: const BorderSide(color: AppColors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(propWidth(10)),
          borderSide: const BorderSide(color: AppColors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(propWidth(10)),
          borderSide: const BorderSide(color: AppColors.blue),
        ),
      ),
      useMaterial3: true,
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
        color: AppColors.white,
        elevation: 0,
        titleTextStyle:
            Fonts.bodyText1(context).copyWith(color: AppColors.black),
        iconTheme: const IconThemeData(color: AppColors.black),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.teal,
          splashFactory: NoSplash.splashFactory,
          overlayColor: AppColors.teal.withOpacity(0.2),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: AppColors.purple.withOpacity(0.2),
        cursorColor: AppColors.blue,
        selectionHandleColor: AppColors.purple,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        hintStyle: Fonts.inputHint(context).copyWith(color: AppColors.black),
        activeIndicatorBorder: const BorderSide(color: AppColors.blue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(propWidth(10)),
          borderSide: const BorderSide(color: AppColors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(propWidth(10)),
          borderSide: const BorderSide(color: AppColors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(propWidth(10)),
          borderSide: const BorderSide(color: AppColors.blue),
        ),
      ),
      useMaterial3: true,
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
