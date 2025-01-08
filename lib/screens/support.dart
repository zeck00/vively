import 'package:flutter/material.dart';
import 'package:vively/services/colors.dart';
import 'package:vively/services/fonts.dart';
import 'package:easy_localization/easy_localization.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('nav.support'.tr(), style: Fonts.headline2(context)),
      ),
      body: const Center(
        child: Text('Support Screen'),
      ),
    );
  }
}
