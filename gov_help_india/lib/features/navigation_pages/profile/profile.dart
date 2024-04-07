import 'package:flutter/material.dart';
import 'package:gov_help_india/services/repository/auth_repo.dart';
import 'package:gov_help_india/utils/constants/sizes.dart';
import 'package:gov_help_india/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
            Card(
              child: Stack(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Confidex"),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: CircularPercentIndicator(
                        radius: 50.0,
                        lineWidth: 10.0,
                        animation: true,
                        percent: 90 / 100,
                        center: Text(
                          90.toString(),
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        backgroundColor: Colors.grey.shade300,
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Colors.redAccent,
                      ),
                    )
                  ],
                ),
              ]),
            ),
            SizedBox(height: 16,),
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
