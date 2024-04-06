import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gov_help_india/features/authentication/controller/auth_controller.dart';
import 'package:gov_help_india/utils/constants/sizes.dart';
import 'package:gov_help_india/utils/helpers/helper_functions.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      body: SizedBox(
        height: THelperFunctions.screenHeight(),
        width: THelperFunctions.screenWidth(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sign-In to continue",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: TSizes.defaultSpace,
            ),
            ElevatedButton(
                onPressed: () => authController.signInGoogle(),
                child: const Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: TSizes.sm, horizontal: TSizes.lg),
                    child: Text("Google Auth")))
          ],
        ),
      ),
    );
  }
}
