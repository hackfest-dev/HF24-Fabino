import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/api/api_handler.dart';
import '../../../complaint_details/view/complaint_details.dart';
import '../controller/home_controller.dart';
import '../modal/issue.dart';

class ComplaintCard extends StatelessWidget {
  const ComplaintCard({super.key, required this.issue});

  final Issue issue;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ComplaintDetails(
        issue: issue,
      )),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(issue.imageUrl)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                     Column(
                      children: [
                        Text(issue.title),
                      ],
                    ),
                    const Spacer(),

                    Row(
                      children: [
                        IconButton(
                            onPressed: () async {

                              await ApiHandler.addSupport(issue.id);
                              HomeController.instance.getNearbyIssues();
                              },
                            icon: const Icon(Icons.arrow_circle_up_rounded)),
                        Text(issue.supportCount.toString())
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
