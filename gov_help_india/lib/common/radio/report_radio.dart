import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gov_help_india/common/radio/radio_controller.dart';
import 'package:gov_help_india/common/snackbar/snackbars.dart';
import 'package:gov_help_india/services/api/api_handler.dart';
import 'package:gov_help_india/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class ReportButton extends StatelessWidget {
  final String issueId;

  const ReportButton({super.key, required this.issueId});
  @override
  Widget build(BuildContext context) {
    final DialogController dialogController = Get.put(DialogController());

    final isDark = THelperFunctions.isDarkMode(context);

    return ElevatedButton(onPressed: () {
      Get.defaultDialog(
        title: 'Report',
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Obx(() => Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RadioListTile<int>(
                  title: Text('Duplicate'),
                  value: 1,
                  groupValue: dialogController.selectedRadio.value,
                  onChanged: (value) {
                    dialogController.setSelectedRadio(value!);
                  },
                ),
                RadioListTile<int>(
                  title: Text('Issue Fixed'),
                  value: 2,
                  groupValue: dialogController.selectedRadio.value,
                  onChanged: (value) {
                    dialogController.setSelectedRadio(value!);
                  },
                ),
                RadioListTile<int>(
                  title: Text('False Issue'),
                  value: 3,
                  groupValue: dialogController.selectedRadio.value,
                  onChanged: (value) {
                    dialogController.setSelectedRadio(value!);
                  },
                ),
                // RadioListTile<int>(
                //   title: Text(''),
                //   value: 4,
                //   groupValue: dialogController.selectedRadio.value,
                //   onChanged: (value) {
                //     dialogController.setSelectedRadio(value!);
                //   },
                // ),
              ],
            ));
          },
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Do something with the selected radio button value
              print('Selected radio: ${dialogController.selectedRadio.value}');
              ApiHandler.addReport(issueId);
              Get.back();
              TSnackBar.errorSnackBar(title: "Reported");

            },
            child: Text('OK'),
          ),
        ],
      );
    }, style: ElevatedButton.styleFrom(
      backgroundColor: isDark ? TColors.dark : TColors.light,
    ), child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
      child: Row(
        children: [
          Icon(
            Iconsax.warning_24, color: isDark ? TColors.light : TColors.dark,),
          const SizedBox(width: TSizes.sm,),
          Text("Report", style: Theme
              .of(context)
              .textTheme
              .bodyMedium,)
        ],
      ),
    ));
  }
}

