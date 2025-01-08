import 'package:flutter/material.dart';
import 'package:vively/screens/home.dart';
import 'package:vively/screens/explore.dart';
import 'package:vively/screens/addAsset.dart';
import 'package:vively/screens/settings.dart';
import 'package:vively/screens/support.dart';
import 'package:vively/services/colors.dart';
import 'package:vively/services/sizeConfig.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const AddAssetScreen(),
    const SettingsScreen(),
    const SupportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: propWidth(20),
              vertical: propHeight(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNavItem(0, Icons.home_rounded, 'nav.home'),
                _buildNavItem(1, Icons.travel_explore_rounded, 'nav.explore'),
                _buildAddButton(),
                _buildNavItem(3, Icons.settings_rounded, 'nav.settings'),
                _buildNavItem(4, Icons.support_agent_rounded, 'nav.support'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => setState(() => _selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: propWidth(12),
          vertical: propHeight(8),
        ),
        decoration: BoxDecoration(
          color:
              isSelected ? AppColors.blue.withOpacity(0.3) : Colors.transparent,
          borderRadius: BorderRadius.circular(propWidth(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? AppColors.white
                  : AppColors.blue.withOpacity(0.8),
              size: propWidth(24),
            ),
            SizedBox(height: propHeight(4)),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = 2),
      child: Container(
        padding: EdgeInsets.all(propWidth(15)),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.purple, AppColors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(propWidth(25)),
          boxShadow: [
            BoxShadow(
              color: AppColors.blue.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Icon(
          Icons.add_rounded,
          color: AppColors.white,
          size: propWidth(24),
        ),
      ),
    );
  }
}
