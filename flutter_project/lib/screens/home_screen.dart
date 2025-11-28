import 'package:flutter/material.dart';
import '../theme.dart';
import '../data/azkar_data.dart';
import 'azkar_screen.dart';
import 'tasbeeh_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  /// Aspect ratio for menu button grid items
  static const double _buttonAspectRatio = 1.2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenDark,
      body: SafeArea(
        child: Column(
          children: [
            // Top white rounded background with Al-Aqsa image
            Expanded(
              child: Stack(
                children: [
                  // White background layer
                  Positioned(
                    top: 81,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.backgroundGray,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  // Beige background layer (content area)
                  Positioned(
                    top: 153,
                    left: 5,
                    right: 5,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.beige,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  // Al-Aqsa Image
                  Positioned(
                    top: 40,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(
                        'assets/images/al_aqsa.webp',
                        height: 180,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // Grid of buttons
                  Positioned(
                    top: 188,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: _buttonAspectRatio,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _buildMenuButton(
                            context: context,
                            title: AppStrings.morningAzkar,
                            icon: 'assets/images/sun.webp',
                            iconSize: 60,
                            onTap: () => _navigateToAzkar(context, AzkarType.morning),
                          ),
                          _buildMenuButton(
                            context: context,
                            title: AppStrings.eveningAzkar,
                            icon: 'assets/images/moon.webp',
                            iconSize: 60,
                            onTap: () => _navigateToAzkar(context, AzkarType.evening),
                          ),
                          _buildMenuButton(
                            context: context,
                            title: AppStrings.prayAzkar,
                            icon: 'assets/images/prayer.webp',
                            iconSize: 50,
                            onTap: () => _navigateToAzkar(context, AzkarType.pray),
                          ),
                          _buildMenuButton(
                            context: context,
                            title: AppStrings.tasbeeh,
                            icon: 'assets/images/tasbeeh.webp',
                            iconSize: 70,
                            onTap: () => _navigateToTasbeeh(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton({
    required BuildContext context,
    required String title,
    required String icon,
    required double iconSize,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.greenLight,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 8,
              child: Image.asset(
                icon,
                width: iconSize,
                height: iconSize,
              ),
            ),
            Positioned(
              bottom: 12,
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAzkar(BuildContext context, AzkarType type) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AzkarScreen(type: type),
      ),
    );
  }

  void _navigateToTasbeeh(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TasbeehScreen(),
      ),
    );
  }
}
