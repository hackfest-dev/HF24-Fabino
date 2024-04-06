import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class FilterButtonWidget extends StatelessWidget {
  const FilterButtonWidget({super.key, required this.text, required this.backgroundColor, required this.onClick});

  final String text;
  final Color backgroundColor;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onClick(),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(0),
        enableFeedback: false,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0), // Adjust the value as needed
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
        child: Text(text, style: Theme.of(context).textTheme.bodyMedium,),
      ),
    );
  }
}
