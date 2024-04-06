import 'package:flutter/material.dart';
import 'package:gov_help_india/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class FooterButtons extends StatelessWidget {
  const FooterButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final isDark = THelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(
          backgroundColor: isDark ? TColors.dark : TColors.light,
        ),child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Row(
            children: [
              Icon(Iconsax.warning_24, color: isDark ? TColors.light : TColors.dark,),
              const SizedBox(width: TSizes.sm,),
              Text("Report", style: Theme.of(context).textTheme.bodyMedium,)
            ],
          ),
        )),
        ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(
          backgroundColor: TColors.primary.withOpacity(0.7),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(TSizes.buttonRadius)
          )
        ), child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text("Support"),
        )),
      ],
    );
  }
}