import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vively/models/asset.dart';
import 'package:vively/services/colors.dart';
import 'package:vively/services/fonts.dart';
import 'package:vively/services/sizeConfig.dart';
import 'package:vively/widgets/button.dart';
import 'package:vively/services/flushbarHelper.dart';

class AssetDetailScreen extends StatelessWidget {
  final Asset asset;
  final bool isCoOwned;

  const AssetDetailScreen({
    super.key,
    required this.asset,
    this.isCoOwned = false,
  });

  @override
  Widget build(BuildContext context) {
    initSizeConfig(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(propWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  SizedBox(height: propHeight(20)),
                  _buildCurrentStatus(context),
                  SizedBox(height: propHeight(15)),
                  if (isCoOwned) Center(child: _buildActionButtons(context)),
                  SizedBox(height: propHeight(10)),
                  _buildOwnersList(context),
                  SizedBox(height: propHeight(10)),
                  _buildScheduleSection(context),
                  SizedBox(height: propHeight(20)),
                  _buildSpecifications(context),
                  SizedBox(height: propHeight(20)),
                  _buildRules(context),
                  SizedBox(height: propHeight(10)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: propHeight(300),
      pinned: true,
      backgroundColor: AppColors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded, color: AppColors.black),
        onPressed: () => Navigator.pop(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: 'asset_${asset.id}',
          child: Image.asset(
            width: double.infinity,
            height: double.infinity,
            asset.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(asset.name, style: Fonts.headline1(context)),
        SizedBox(height: propHeight(10)),
        Row(
          children: [
            Icon(Icons.location_on_outlined,
                size: propWidth(20), color: AppColors.black.withOpacity(0.7)),
            SizedBox(width: propWidth(5)),
            Text(asset.location, style: Fonts.bodyText1(context)),
          ],
        ),
        SizedBox(height: propHeight(15)),
        Text(asset.description, style: Fonts.bodyText2(context)),
      ],
    );
  }

  Widget _buildCurrentStatus(BuildContext context) {
    if (asset.owners.isEmpty) {
      return Container(); // Or show a message that no owners exist yet
    }

    final currentOwner = asset.owners.firstWhere(
      (owner) =>
          owner.schedules.any((schedule) => schedule.status == 'current'),
      orElse: () => asset.owners.first,
    );

    return Container(
      padding: EdgeInsets.all(propWidth(15)),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blue.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(propWidth(15)),
        color: AppColors.blue.withOpacity(0.05),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'asset.currentStatus'.tr(),
            style: Fonts.subtitle1(context),
          ),
          SizedBox(height: propHeight(10)),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.blue,
                radius: propWidth(25),
                child: Icon(Icons.person_4_rounded,
                    size: propWidth(30), color: AppColors.white),
              ),
              SizedBox(width: propWidth(10)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentOwner.name,
                      style: Fonts.bodyText1(context),
                    ),
                    if (asset.currentSchedule != null)
                      Text(
                        'Until ${DateFormat('MMM dd, yyyy').format(asset.currentSchedule!.endDate)}',
                        style: Fonts.bodyText2(context),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOwnersList(BuildContext context) {
    if (asset.owners.isEmpty) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'asset.owners'.tr(),
          style: Fonts.subtitle1(context),
        ),
        SizedBox(height: propHeight(15)),
        SizedBox(
          height: propHeight(80),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: asset.owners.length,
            itemBuilder: (context, index) {
              final owner = asset.owners[index];
              return Container(
                width: propWidth(200),
                margin: EdgeInsets.only(right: propWidth(15)),
                padding: EdgeInsets.all(propWidth(15)),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.black.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(propWidth(15)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.blue,
                      radius: propWidth(20),
                      child: Icon(Icons.person_4_rounded,
                          size: propWidth(25), color: AppColors.white),
                    ),
                    SizedBox(width: propWidth(10)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            owner.name,
                            style: Fonts.bodyText1(context),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${(owner.ownership * 100).toStringAsFixed(0)}% Share',
                            style: Fonts.bodyText2(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildScheduleSection(BuildContext context) {
    final schedules = asset.owners.expand((owner) => owner.schedules).toList();
    if (schedules.isEmpty) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'asset.schedule'.tr(),
          style: Fonts.subtitle1(context),
        ),
        SizedBox(height: propHeight(15)),
        SizedBox(
          height: propHeight(120),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: schedules.length,
            itemBuilder: (context, index) {
              final schedule = schedules[index];
              final owner = asset.owners.firstWhere(
                (owner) => owner.schedules.contains(schedule),
              );
              return Container(
                width: propWidth(200),
                margin: EdgeInsets.only(right: propWidth(15)),
                padding: EdgeInsets.all(propWidth(15)),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _getScheduleColor(schedule.status).withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(propWidth(15)),
                  color: _getScheduleColor(schedule.status).withOpacity(0.05),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.blue,
                          radius: propWidth(15),
                          child: Icon(Icons.person_4_rounded,
                              size: propWidth(20), color: AppColors.white),
                        ),
                        SizedBox(width: propWidth(10)),
                        Expanded(
                          child: Text(
                            owner.name,
                            style: Fonts.bodyText1(context),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: propHeight(10)),
                    Text(
                      '${DateFormat('MMM dd').format(schedule.startDate)} - ${DateFormat('MMM dd').format(schedule.endDate)}',
                      style: Fonts.bodyText2(context),
                    ),
                    if (schedule.isExtensionRequested)
                      Container(
                        margin: EdgeInsets.only(top: propHeight(5)),
                        padding: EdgeInsets.symmetric(
                          horizontal: propWidth(8),
                          vertical: propHeight(2),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.purple.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(propWidth(5)),
                        ),
                        child: Text(
                          'Extension Requested',
                          style: Fonts.smallText(context)
                              .copyWith(color: AppColors.purple),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getScheduleColor(String status) {
    switch (status) {
      case 'current':
        return AppColors.blue;
      case 'upcoming':
        return AppColors.mint;
      default:
        return AppColors.black;
    }
  }

  Widget _buildSpecifications(BuildContext context) {
    if (asset.specifications.isEmpty) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'asset.specifications'.tr(),
          style: Fonts.subtitle1(context),
        ),
        SizedBox(height: propHeight(15)),
        Wrap(
          spacing: propWidth(10),
          runSpacing: propHeight(10),
          children: asset.specifications.entries.map((spec) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: propWidth(15),
                vertical: propHeight(8),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.black.withOpacity(0.1)),
                borderRadius: BorderRadius.circular(propWidth(10)),
              ),
              child: Column(
                children: [
                  Text(
                    spec.key,
                    style: Fonts.smallText(context),
                  ),
                  Text(
                    spec.value,
                    style: Fonts.bodyText1(context),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildRules(BuildContext context) {
    if (asset.rules.isEmpty) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'asset.rules'.tr(),
          style: Fonts.subtitle1(context),
        ),
        SizedBox(height: propHeight(15)),
        ...asset.rules.map((rule) {
          return Padding(
            padding: EdgeInsets.only(bottom: propHeight(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check_circle_outline,
                    size: propWidth(20), color: AppColors.blue),
                SizedBox(width: propWidth(10)),
                Expanded(
                  child: Text(
                    rule,
                    style: Fonts.bodyText2(context),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomButton(
          w: (145),
          h: (40),
          text: 'asset.requestAccess'.tr(),
          onPressed: () => _handleRequestAccess(context),
          gradient: const LinearGradient(
            colors: [AppColors.blue, AppColors.mint],
            transform: GradientRotation(90),
          ),
        ),
        Expanded(child: Container()),
        CustomButton(
          w: (145),
          h: (40),
          text: 'asset.requestExtension'.tr(),
          onPressed: () => _handleRequestExtension(context),
          gradient: const LinearGradient(
            colors: [AppColors.purple, AppColors.blue],
            transform: GradientRotation(90),
          ),
        ),
        SizedBox(height: propHeight(10)),
      ],
    );
  }

  void _handleRequestAccess(BuildContext context) {
    // Here you would typically make an API call
    // For now, we'll just show a success message
    FlushbarHelper.showSuccess(
      context: context,
      message: 'asset.requestAccessSuccess'.tr(),
    );
  }

  void _handleRequestExtension(BuildContext context) {
    // Here you would typically make an API call
    // For now, we'll just show a success message
    FlushbarHelper.showSuccess(
      context: context,
      message: 'asset.requestExtensionSuccess'.tr(),
    );
  }
}
