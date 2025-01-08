import 'package:flutter/material.dart';
import 'package:vively/services/colors.dart';
import 'package:vively/services/fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:vively/services/sizeConfig.dart';
import 'package:provider/provider.dart';
import 'package:vively/providers/authProvider.dart';
import 'package:vively/screens/login.dart';
import 'package:vively/utils/flushbar_helper.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkMode = false;
  bool _biometricEnabled = false;

  @override
  Widget build(BuildContext context) {
    bool isArabic = context.locale == const Locale('ar');

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        title: Image.asset(
          isArabic ? 'assets/images/arName.png' : 'assets/images/enName.png',
          width: isArabic ? propWidth(100) : propWidth(90),
          height: isArabic ? propHeight(30) : propHeight(25),
          fit: isArabic ? BoxFit.fitHeight : BoxFit.fitHeight,
          color: AppColors.teal,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(propWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'nav.settings'.tr(),
                style: Fonts.headline1(context),
              ),
              SizedBox(height: propHeight(30)),

              // Language Settings
              _buildSectionHeader('settings.language'.tr()),
              _buildLanguageSelector(),
              _buildDivider(),

              // Notification Settings
              _buildSectionHeader('settings.notifications'.tr()),
              SwitchListTile(
                value: _notificationsEnabled,
                onChanged: (value) {
                  setState(() => _notificationsEnabled = value);
                  FlushbarHelper.showSuccess(
                    context: context,
                    message: value
                        ? 'settings.notificationsEnabled'.tr()
                        : 'settings.notificationsDisabled'.tr(),
                  );
                },
                title: Text(
                  'settings.pushNotifications'.tr(),
                  style: Fonts.bodyText1(context),
                ),
                activeColor: AppColors.blue,
              ),
              _buildDivider(),

              // Security Settings
              _buildSectionHeader('settings.security'.tr()),
              SwitchListTile(
                value: _biometricEnabled,
                onChanged: (value) {
                  setState(() => _biometricEnabled = value);
                  FlushbarHelper.showSuccess(
                    context: context,
                    message: value
                        ? 'settings.biometricEnabled'.tr()
                        : 'settings.biometricDisabled'.tr(),
                  );
                },
                title: Text(
                  'settings.biometric'.tr(),
                  style: Fonts.bodyText1(context),
                ),
                activeColor: AppColors.blue,
              ),
              _buildDivider(),

              // Appearance Settings
              _buildSectionHeader('settings.appearance'.tr()),
              SwitchListTile(
                value: _darkMode,
                onChanged: (value) {
                  setState(() => _darkMode = value);
                  FlushbarHelper.showSuccess(
                    context: context,
                    message: value
                        ? 'settings.darkModeEnabled'.tr()
                        : 'settings.darkModeDisabled'.tr(),
                  );
                },
                title: Text(
                  'settings.darkMode'.tr(),
                  style: Fonts.bodyText1(context),
                ),
                activeColor: AppColors.blue,
              ),
              _buildDivider(),

              // Account Settings
              _buildSectionHeader('settings.account'.tr()),
              ListTile(
                onTap: () {
                  // Handle profile edit
                },
                leading: const Icon(Icons.person_outline),
                title: Text(
                  'settings.editProfile'.tr(),
                  style: Fonts.bodyText1(context),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
              ListTile(
                onTap: () {
                  // Handle password change
                },
                leading: const Icon(Icons.lock_outline),
                title: Text(
                  'settings.changePassword'.tr(),
                  style: Fonts.bodyText1(context),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
              ListTile(
                onTap: () {
                  context.read<AuthProvider>().logout();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                leading: const Icon(Icons.logout_rounded),
                title: Text(
                  'settings.logout'.tr(),
                  style: Fonts.bodyText1(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageSelector() {
    bool isArabic = context.locale == const Locale('ar');
    return ListTile(
      title: Text(
        'settings.currentLanguage'.tr(),
        style: Fonts.bodyText1(context),
      ),
      trailing: TextButton.icon(
        onPressed: () {
          if (isArabic) {
            context.setLocale(const Locale('en'));
          } else {
            context.setLocale(const Locale('ar'));
          }
          FlushbarHelper.showSuccess(
            context: context,
            message: 'settings.languageChanged'.tr(),
          );
        },
        icon: Text(
          isArabic ? 'العربية' : 'English',
          style: Fonts.bodyText1(context).copyWith(color: AppColors.blue),
        ),
        label: const Icon(Icons.translate, color: AppColors.blue),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: propHeight(10)),
      child: Text(
        title,
        style: Fonts.subtitle1(context),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: AppColors.black.withOpacity(0.1),
      thickness: 1,
      height: propHeight(20),
    );
  }
}
