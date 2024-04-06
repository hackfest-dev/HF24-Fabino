
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gov_help_india/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class TSnackBar {
    static errorSnackBar({required String title, String message = ''}){
      Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TColors.white,
        backgroundColor: TColors.error,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(20),
        icon: Icon(Iconsax.warning_2, color: TColors.white,)
      );
    }
    static warningSnackBar({required String title, String message = ''}){
      Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TColors.white,
        backgroundColor: TColors.warning,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(20),
        icon: Icon(Iconsax.warning_2, color: TColors.white,)
      );
    }
    static sucessSnackBar({required String title, String message = ''}){
      Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TColors.white,
        backgroundColor: TColors.success,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(20),
        icon: Icon(Iconsax.warning_2, color: TColors.white,)
      );
    }
}
