import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gov_help_india/features/raise_issue/controller/form_controller.dart';
import 'package:gov_help_india/features/raise_issue/controller/raise_issue_controller.dart';
import 'package:gov_help_india/features/raise_issue/view/upload_widget.dart';
import 'package:gov_help_india/utils/constants/colors.dart';
import 'package:gov_help_india/utils/constants/sizes.dart';
import 'package:gov_help_india/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import 'form_fields.dart';

class RaiseIssuePage extends StatelessWidget {
  const RaiseIssuePage({super.key});

  @override
  Widget build(BuildContext context) {

    final isDark = THelperFunctions.isDarkMode(context);
    final RaiseIssueController raiseIssueController = Get.put(RaiseIssueController()) ;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(canPop: true), icon: Icon(Icons.arrow_back_rounded, color: isDark ? TColors.light : TColors.dark,),),
        elevation: 0,
        centerTitle: true,
        title: Text("Raise Issue", style: Theme.of(context).textTheme.titleLarge,),
      ),

      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [

              const UploadImageWidget(),


              const SizedBox(height: TSizes.md,),

              Obx(
                    () {
                  if (raiseIssueController.imageFile != null) {
                    return FittedBox(
                      fit: BoxFit.contain,
                      child: SizedBox(
                        width: 150, // Set the desired width
                        height: 150, // Set the desired height
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image.file(raiseIssueController.imageFile!),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),

              const SizedBox(height: TSizes.md,),


              FormFields(),

              const SizedBox(height: TSizes.sm,),


              ElevatedButton(onPressed: () async {
                await Future.delayed(Duration(seconds: 3));
                raiseIssueController.raiseIssue();
              } , child: Center(child: Text("Submit"),))
            ],
          ),
        ),
      ),
    );
  }
}

