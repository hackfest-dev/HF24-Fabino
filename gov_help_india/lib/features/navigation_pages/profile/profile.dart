import 'package:flutter/material.dart';
import 'package:gov_help_india/services/repository/auth_repo.dart';
import 'package:gov_help_india/utils/constants/sizes.dart';
import 'package:gov_help_india/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: SizedBox(
        width: THelperFunctions.screenWidth(),
        height: THelperFunctions.screenHeight(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => AuthenticationRepository.instance.logout(),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Iconsax.logout),
                    SizedBox(
                      width: TSizes.defaultSpace,
                    ),
                    Text("Logout")
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
