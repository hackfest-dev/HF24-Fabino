import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gov_help_india/common/loader/circular_loader.dart';
import 'package:gov_help_india/features/location%20denied/location_denied_page.dart';
import 'package:gov_help_india/features/navigation_pages/home/controller/home_controller.dart';
import 'package:gov_help_india/features/navigation_pages/home/view/complaint_card.dart';
import 'package:gov_help_india/features/navigation_pages/home/view/filter_buttons.dart';
import 'package:gov_help_india/navigation_menu.dart';
import 'package:gov_help_india/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/sizes.dart';
import '../modal/issue.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    return Obx(() => homeController.area.value!.isNotEmpty
        ? HomePageContent()
        : TCircularLoading());
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Recent Complaints"),
            Text(HomeController.instance.area.value!),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
        child: RefreshIndicator(onRefresh: HomeController.instance.getNearbyIssues,
          child: Column(
            children: [
              FilterButtons(),
              const SizedBox(height: TSizes.md),
              Obx(() => SizedBox(
                height: THelperFunctions.screenHeight() * 0.65,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: HomeController.instance.issues.value.length,
                  itemBuilder: (BuildContext context, int index) {
                    final id = HomeController.instance.issues.value[index].keys.first;
                    final issueData = HomeController.instance.issues.value[index].values.first;
                    final issue = Issue.fromJson(id, issueData);
                    return ComplaintCard(issue: issue);
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}




