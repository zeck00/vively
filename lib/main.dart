import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:vively/screens/home.dart';
import 'package:vively/screens/welcome.dart';
import 'package:vively/services/size_config.dart';
import 'services/colors.dart';
import 'services/fonts.dart';
import 'package:provider/provider.dart';
import 'package:vively/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/locales',
      fallbackLocale: const Locale('en'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          return auth.isLoggedIn ? const HomeScreen() : const WelcomeScreen();
        },
      ),
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
        hintStyle:
            Fonts.inputHintGrey(context).copyWith(color: AppColors.black),
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
        bodySmall: Fonts.bodyText2(context),
        headlineMedium: Fonts.headline1(context),
        headlineSmall: Fonts.headline2(context),
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
        hintStyle: Fonts.inputHintGrey(context),
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
        bodySmall: Fonts.bodyText2(context).copyWith(color: AppColors.white),
        headlineMedium:
            Fonts.headline1(context).copyWith(color: AppColors.mint),
        headlineSmall: Fonts.headline2(context).copyWith(color: AppColors.mint),
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
