import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gov_help_india/features/navigation_pages/history/controller.dart';
import 'package:gov_help_india/features/navigation_pages/history/history_card.dart';

import '../home/modal/issue.dart';


class HistoryPage extends StatelessWidget {

  HistoryPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final HistoryController controller = Get.put(HistoryController());
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Obx(() => ListView.builder(
        itemCount: controller.historyList.value.length, // Corrected variable name
        itemBuilder: (BuildContext context, int index) {
          final id = controller.historyList[index].keys.first;
          final issueData = controller.historyList[index].values.first;
          final issue = Issue.fromJson(id, issueData);
          return HistoryCard(issue: issue,);
        },
      )),
    );
  }
}
