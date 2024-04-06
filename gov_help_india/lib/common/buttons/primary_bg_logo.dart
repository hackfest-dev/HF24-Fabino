import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/sizes.dart';

class PrimaryBgIconButton extends StatelessWidget {
  const PrimaryBgIconButton({
    super.key, required this.onPressed, required this.iconData,
  });

  final Function onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.sm),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue, // Set the background color here
        ),
        child: IconButton(
          onPressed: () => onPressed(),
          icon: Icon(
            iconData,
            color: Colors.white, // Set the icon color here
          ),
        ),
      ),
    );
  }
}