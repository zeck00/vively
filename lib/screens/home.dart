import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vively/screens/login.dart';
import 'package:vively/services/colors.dart';
import 'package:vively/services/fonts.dart';
import 'package:vively/services/size_config.dart';
import 'package:vively/widgets/button.dart';
import 'package:vively/models/asset.dart';
import 'package:vively/screens/asset_detail.dart';
import 'package:vively/providers/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'all';

  @override
  Widget build(BuildContext context) {
    initSizeConfig(context);
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
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined,
                color: AppColors.black),
            onPressed: () {
              // Handle notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout_rounded, color: AppColors.black),
            onPressed: () {
              context.read<AuthProvider>().logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: propWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: propHeight(20)),
              Text(
                'home.welcome'.tr(),
                style: Fonts.headline1(context),
              ),
              SizedBox(height: propHeight(20)),
              // Search Bar
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  hintText: 'home.searchHint'.tr(),
                  hintStyle: Fonts.inputHintGrey(context),
                  prefixIcon: Icon(Icons.search,
                      color: AppColors.black.withOpacity(0.5)),
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
              ),
              SizedBox(height: propHeight(20)),
              // Filter Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterChip('all'),
                    SizedBox(width: propWidth(10)),
                    _buildFilterChip('cars'),
                    SizedBox(width: propWidth(10)),
                    _buildFilterChip('homes'),
                    SizedBox(width: propWidth(10)),
                    _buildFilterChip('gadgets'),
                  ],
                ),
              ),
              SizedBox(height: propHeight(30)),
              // Quick Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildQuickAction(
                    Icons.add_circle_outline,
                    'home.actions.addAsset'.tr(),
                    () {
                      // Handle add asset
                    },
                  ),
                  _buildQuickAction(
                    Icons.explore_outlined,
                    'home.actions.explore'.tr(),
                    () {
                      // Handle explore
                    },
                  ),
                  _buildQuickAction(
                    Icons.notifications_outlined,
                    'home.actions.notifications'.tr(),
                    () {
                      // Handle notifications
                    },
                  ),
                ],
              ),
              SizedBox(height: propHeight(30)),
              // My Assets Section
              Text(
                'home.myAssets'.tr(),
                style: Fonts.headline2(context),
              ),
              SizedBox(height: propHeight(20)),
              SizedBox(
                height: propHeight(230),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: myAssets.length,
                  itemBuilder: (context, index) =>
                      _buildAssetCard(myAssets[index]),
                ),
              ),
              SizedBox(height: propHeight(30)),
              // Feed Section
              Text(
                'home.feed'.tr(),
                style: Fonts.headline2(context),
              ),
              SizedBox(height: propHeight(20)),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: feedAssets.length,
                itemBuilder: (context, index) =>
                    _buildFeedItem(feedAssets[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String filter) {
    bool isSelected = _selectedFilter == filter;
    return ChoiceChip(
      label: Text(
        'home.filters.$filter'.tr(),
        style: Fonts.chipText(context, isSelected),
      ),
      selected: isSelected,
      onSelected: (bool selected) {
        setState(() {
          _selectedFilter = selected ? filter : 'all';
        });
      },
      backgroundColor: AppColors.white,
      selectedColor: AppColors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(propWidth(20)),
        side: BorderSide(
          color: isSelected ? AppColors.blue : AppColors.black,
        ),
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: propWidth(50),
            height: propWidth(50),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.blue, AppColors.mint],
                transform: GradientRotation(90),
              ),
              borderRadius: BorderRadius.circular(propWidth(25)),
            ),
            child: Icon(icon, color: AppColors.white),
          ),
          SizedBox(height: propHeight(8)),
          Text(
            label,
            style: Fonts.smallText(context),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAssetCard(Asset asset) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AssetDetailScreen(
              asset: asset,
              isCoOwned: true,
            ),
          ),
        );
      },
      child: Container(
        width: propWidth(280),
        margin: EdgeInsets.only(right: propWidth(15)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(propWidth(15)),
          border: Border.all(color: AppColors.black),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(propWidth(15)),
                topRight: Radius.circular(propWidth(15)),
              ),
              child: Image.asset(
                asset.image,
                height: propHeight(120),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(propWidth(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    asset.name,
                    style: Fonts.subtitle1(context),
                  ),
                  SizedBox(height: propHeight(5)),
                  Text(
                    asset.location,
                    style: Fonts.bodyText2(context),
                  ),
                  SizedBox(height: propHeight(5)),
                  Text(
                    '${(asset.sharePrice / 1000000).toStringAsFixed(1)}M AED/share',
                    style: Fonts.highlightedText(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedItem(Asset asset) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AssetDetailScreen(
              asset: asset,
              isCoOwned: false,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: propHeight(15)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(propWidth(15)),
          border: Border.all(color: AppColors.black),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(propWidth(15)),
                topRight: Radius.circular(propWidth(15)),
              ),
              child: Image.asset(
                asset.image,
                height: propHeight(200),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(propWidth(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        asset.name,
                        style: Fonts.subtitle1(context),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: propWidth(10),
                          vertical: propHeight(5),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.mint.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(propWidth(20)),
                        ),
                        child: Text(
                          asset.type.toUpperCase(),
                          style: Fonts.smallText(context).copyWith(
                            color: AppColors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: propHeight(5)),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          size: propWidth(16),
                          color: AppColors.black.withOpacity(0.7)),
                      SizedBox(width: propWidth(5)),
                      Text(
                        asset.location,
                        style: Fonts.bodyText2(context),
                      ),
                    ],
                  ),
                  SizedBox(height: propHeight(10)),
                  Text(
                    asset.description,
                    style: Fonts.bodyText2(context),
                  ),
                  SizedBox(height: propHeight(10)),
                  Wrap(
                    spacing: propWidth(10),
                    runSpacing: propHeight(5),
                    children: asset.features
                        .map((feature) => Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: propWidth(8),
                                vertical: propHeight(4),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.black.withOpacity(0.2)),
                                borderRadius:
                                    BorderRadius.circular(propWidth(15)),
                              ),
                              child: Text(
                                feature,
                                style: Fonts.smallText(context),
                              ),
                            ))
                        .toList(),
                  ),
                  SizedBox(height: propHeight(15)),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Share Price',
                            style: Fonts.smallText(context),
                          ),
                          Text(
                            '${(asset.sharePrice / 1000000).toStringAsFixed(1)}M AED',
                            style: Fonts.highlightedText(context),
                          ),
                        ],
                      ),
                      const Spacer(),
                      CustomButton(
                        w: 150,
                        h: 40,
                        text: 'home.posts.requestJoin'.tr(),
                        onPressed: () {
                          // Handle request to join
                        },
                        gradient: const LinearGradient(
                          colors: [AppColors.blue, AppColors.mint],
                          transform: GradientRotation(90),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}