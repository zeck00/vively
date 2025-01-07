import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vively/services/colors.dart';
import 'package:vively/services/fonts.dart';
import 'package:vively/services/size_config.dart';
import 'package:vively/widgets/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    initSizeConfig(context);
    bool isArabic = context.locale == const Locale('ar');

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_rounded, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(
          child: Image.asset(
            isArabic ? 'assets/images/arName.png' : 'assets/images/enName.png',
            width: isArabic ? propWidth(100) : propWidth(90),
            height: isArabic ? propHeight(40) : propHeight(35),
            fit: isArabic ? BoxFit.fitHeight : BoxFit.fitWidth,
            color: AppColors.purple,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language_rounded, color: AppColors.black),
            onPressed: () => context.locale == const Locale('en')
                ? context.setLocale(const Locale('ar'))
                : context.setLocale(const Locale('en')),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: propWidth(20)),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: propHeight(40)),
                Text(
                  'login.title'.tr(),
                  style: Fonts.headline1(context),
                ),
                SizedBox(height: propHeight(30)),
                TextFormField(
                  style: const TextStyle(color: AppColors.black),
                  controller: _usernameController,
                  cursorHeight: propHeight(16),
                  cursorWidth: propWidth(2),
                  cursorRadius: Radius.circular(propWidth(12)),
                  cursorColor: AppColors.blue,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    hintText: 'placeholders.enterUsername'.tr(),
                    hintStyle: Fonts.inputHintGrey(context),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'errors.requiredField'.tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: propHeight(20)),
                TextFormField(
                  style: const TextStyle(color: AppColors.black),
                  controller: _passwordController,
                  obscureText: true,
                  cursorHeight: propHeight(16),
                  cursorWidth: propWidth(2),
                  cursorRadius: Radius.circular(propWidth(12)),
                  cursorColor: AppColors.blue,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    hintText: 'placeholders.enterPassword'.tr(),
                    hintStyle: Fonts.inputHintGrey(context),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'errors.requiredField'.tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: propHeight(10)),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Handle forgot password
                    },
                    child: Text(
                      'login.forgotPassword'.tr(),
                      style: Fonts.linkText(context, true),
                    ),
                  ),
                ),
                SizedBox(height: propHeight(30)),
                Center(
                  child: CustomButton(
                    w: 300,
                    h: 40,
                    text: 'buttons.login'.tr(),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle login
                      }
                    },
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.blue,
                        AppColors.lavender,
                      ],
                      transform: GradientRotation(-90),
                    ),
                  ),
                ),
                SizedBox(height: propHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'login.signupPrompt'.tr(),
                      style: Fonts.linkText(context, false).copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle signup navigation
                      },
                      child: Text(
                        'login.signupLink'.tr(),
                        style: Fonts.linkText(context, true),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
