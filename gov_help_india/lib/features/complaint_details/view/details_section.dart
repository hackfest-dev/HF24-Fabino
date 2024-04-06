import 'package:flutter/material.dart';
import 'package:gov_help_india/utils/helpers/helper_functions.dart';

import '../../../utils/constants/sizes.dart';
import '../../navigation_pages/home/modal/issue.dart';
import 'issue_location_marker.dart';

class ComplaintDetailsBodySection extends StatelessWidget {
  const ComplaintDetailsBodySection({super.key, required this.issue});

  final Issue issue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: THelperFunctions.screenHeight() * 0.75,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("ISSUE:"),
            Text(issue.title),
            const SizedBox(
              width: 500,
              height: 200,
              child: IssueLocationMarker(),
            ),
            const Text("DESC: "),
            Text(issue.description),
            const SizedBox(
              height: TSizes.defaultSpace,
            ),
            Image.network(issue.imageUrl),
          ],
        ),
      ),
    );
  }
}
