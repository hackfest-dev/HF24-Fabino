import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gov_help_india/features/navigation_pages/profile/profile.dart';
import 'package:gov_help_india/utils/constants/colors.dart';
import 'package:gov_help_india/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import 'features/navigation_pages/history/history_page.dart';
import 'features/navigation_pages/home/view/home.dart';
import 'features/raise_issue/view/raise_issue_page.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});

  final navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const RaiseIssuePage()),
        backgroundColor: TColors.primary,
        child: const Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: isDark ? TColors.dark : TColors.light,
          indicatorColor: isDark
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          selectedIndex: navigationController.selectedIndex.value,
          onDestinationSelected: (index) =>
              navigationController.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Iconsax.home,
                ),
                label: "Home"),
            NavigationDestination(
                icon: Icon(
                  Iconsax.clipboard_text,
                ),
                label: "History"),
            NavigationDestination(
                icon: Icon(
                  Iconsax.user,
                ),
                label: "Profile")
          ],
        ),
      ),
      body: Obx(() => navigationController
          .screens[navigationController.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomePage(),
    HistoryPage(),
    const ProfilePage()
  ];
}
