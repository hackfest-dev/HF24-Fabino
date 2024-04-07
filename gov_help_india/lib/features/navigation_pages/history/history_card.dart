import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../complaint_details/view/complaint_details.dart';
import '../home/modal/issue.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key, required this.issue});
  final Issue issue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ComplaintDetails(issue: issue,)),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              SizedBox(width: 12,),
              Text(issue.title),
              Spacer(),
              CircleAvatar(
                radius: 4,
                backgroundColor: issue.status == "Active" ? Colors.green : Colors.redAccent,

              ),
              SizedBox(width: 10,),
              Text(issue.status)
            ],
          ),
        ),
      ),
    );
  }
}
