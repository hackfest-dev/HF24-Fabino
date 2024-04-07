import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gov_help_india/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../../navigation_pages/home/modal/issue.dart';
import 'details_section.dart';
import 'footer_buttons.dart';

class ComplaintDetails extends StatelessWidget {
  const ComplaintDetails({super.key, required this.issue,});
  final Issue issue;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),


      body: Padding(
        padding: const EdgeInsets.all(TSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ComplaintDetailsBodySection(issue: issue,),

            const Expanded(
              child: SizedBox(),
            ),
            FooterButtons(issueId: issue.id, supportCount: issue.supportCount,),
          ],
        ),
      ),
    );
  }
}


