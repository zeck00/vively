import 'package:flutter/material.dart';
import 'package:vively/services/colors.dart';
import 'package:vively/services/fonts.dart';
import 'package:easy_localization/easy_localization.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('nav.explore'.tr(), style: Fonts.headline2(context)),
      ),
      body: const Center(
        child: Text('Explore Screen'),
      ),
    );
  }
}
