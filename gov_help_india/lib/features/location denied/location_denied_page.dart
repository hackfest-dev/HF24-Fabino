import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gov_help_india/features/navigation_pages/home/controller/home_controller.dart';
import 'package:gov_help_india/utils/constants/sizes.dart';
import 'package:gov_help_india/utils/device/device_utility.dart';
import 'package:gov_help_india/utils/device/permission_handlers.dart';
import 'package:gov_help_india/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../services/api/api_handler.dart';

class LocationDeniedPage extends StatelessWidget {
  const LocationDeniedPage({super.key});


  @override
  Widget build(BuildContext context) {

    final HomeController homeController = Get.find();
    final _storage = GetStorage();

    return Scaffold(
      body: SizedBox(
        height: THelperFunctions.screenHeight() * 0.7,
        child: Padding(
          padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Please Enable Location"),
              const SizedBox(
                height: TSizes.sm,
              ),
              ElevatedButton(
                  onPressed: () async {
                    try{
                      final location = await TPermissionHandlers.locationPermission();
                      _storage.write("location", location);
                      homeController.area.value = await ApiHandler.getStateFromLatLong(location!.latitude, location.longitude);
                    } catch (e){

                      if (kDebugMode) {
                        print("*************************************************** $e");
                      }
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: TSizes.sm,
                      ),
                      Icon(Iconsax.location),
                      SizedBox(
                        width: TSizes.sm,
                      ),
                      Text("Enable Location")
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
