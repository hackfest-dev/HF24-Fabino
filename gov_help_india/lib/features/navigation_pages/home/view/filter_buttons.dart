import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:gov_help_india/features/navigation_pages/home/controller/home_controller.dart';
import 'package:gov_help_india/utils/constants/sizes.dart';
import 'package:gov_help_india/utils/helpers/helper_functions.dart';

import '../../../../common/buttons/filter_button_widget.dart';
import '../../../../utils/constants/colors.dart';

class FilterButtons extends StatelessWidget {
  FilterButtons({super.key});

  final homeController = HomeController.instance;
  @override
  Widget build(BuildContext context) {
  final isDark = THelperFunctions.isDarkMode(context);
    return SizedBox(
      height: 56,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: homeController.filterItems.length,
            itemBuilder: (BuildContext context, int index) {
              // For each item in the list, create a FilterButtonWidget
              return Padding(
                padding: const EdgeInsets.only(right: TSizes.sm),
                child: Obx(
                  () => FilterButtonWidget(
                    onClick: () => homeController.onFilterButtonClick(index),
                    text: homeController.filterItems[index],
                    backgroundColor: index == homeController.selectedFilter.value
                        ? TColors.primary
                        : isDark ? TColors.darkerGrey : TColors.lightGrey,
                  ),
                ),
              );
            },
          ),
      ),
    );
  }
}
