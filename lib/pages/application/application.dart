import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/home/view/home.dart';
import 'package:ulearning_app/pages/application/nav_index_notifier.dart';
// import 'package:ulearning_app/pages/home.dart';

class Application extends ConsumerWidget {
  static const String id = '/application';

  const Application({Key? key}) : super(key: key);

  void _onItemSelected(int index, WidgetRef ref) {
    ref.read(navIndexNotifierProvider.notifier).changeIndex(index);
    // Additional navigation logic can be added here if needed
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(navIndexNotifierProvider);

    return Scaffold(
      body: index == 0
          ? Home()
          : Center(
              child: Text(
                index.toString(),
                style: TextStyle(fontSize: 50),
              ),
            ),
      bottomNavigationBar: BottomNavyBar(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        backgroundColor: AppColors.primaryElementText,
        selectedIndex: index,
        onItemSelected: (index) => _onItemSelected(index, ref),
        items: <BottomNavyBarItem>[
          _buildNavItem(Icons.home, 'Home', context),
          _buildNavItem(Icons.search, 'Search', context),
          _buildNavItem(Icons.video_call, 'Video', context),
          _buildNavItem(Icons.message, 'Message', context),
          _buildNavItem(Icons.person, 'Profile', context),
        ],
      ),
    );
  }

  BottomNavyBarItem _buildNavItem(
      IconData icon, String title, BuildContext context) {
    return BottomNavyBarItem(
      activeColor: AppColors.primaryElement,
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      icon: Icon(
        icon,
        color: AppColors.primaryText,
      ),
    );
  }
}
