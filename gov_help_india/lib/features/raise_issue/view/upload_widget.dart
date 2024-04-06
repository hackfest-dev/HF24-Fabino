import 'package:flutter/material.dart';
import 'package:gov_help_india/features/raise_issue/controller/raise_issue_controller.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/buttons/primary_bg_logo.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class UploadImageWidget extends StatelessWidget {
  const UploadImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.buttonRadius),
        border: Border.all(
            color: TColors.grey,
            width: 1
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: TSizes.sm,),
          Text("Upload Images", style: Theme.of(context).textTheme.bodyMedium,),
          const Spacer(),

          PrimaryBgIconButton(onPressed: () => RaiseIssueController.instance.pickImage(ImageSource.gallery), iconData: Iconsax.document_upload1,),
          PrimaryBgIconButton(onPressed: () => RaiseIssueController.instance.pickImage(ImageSource.camera), iconData: Iconsax.camera),
        ],
      ),
    );
  }
}


