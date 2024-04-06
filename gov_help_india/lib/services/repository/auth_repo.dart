import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gov_help_india/features/authentication/views/auth.dart';
import 'package:gov_help_india/features/location%20denied/location_denied_page.dart';
import 'package:gov_help_india/navigation_menu.dart';
import 'package:gov_help_india/services/exceptions/firebase_auth.dart';
import 'package:gov_help_india/utils/device/permission_handlers.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final _storage = GetStorage();
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> user;

  @override
  void onReady() {
    user = Rx<User?>(_auth.currentUser);
    user.bindStream(_auth.userChanges());
    ever(user, _setInitialScreen);
  }

  Future<void> _setInitialScreen(User? user) async {
    if (user == null) {
      Get.offAll(() => const AuthPage());
    } else {
      _storage.write('user_uid', user.uid);
      Get.offAll(() => NavigationMenu());
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the Auth Details
      final GoogleSignInAuthentication? gAuth =
          await userAccount?.authentication;

      // obtain credentials
      final credentials = GoogleAuthProvider.credential(
          accessToken: gAuth?.accessToken, idToken: gAuth?.idToken);

      // entry in Firebase
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptionHelper(e).message;
    } catch (e) {
      if (kDebugMode) {
        print("Exception: $e");
      }
      return null;
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut(); // Sign out from Firebase Auth
      await GoogleSignIn().signOut(); // Sign out from Google Sign-In
      await GoogleSignIn().disconnect(); // Disconnect from Google services

      // Reset navigation to AuthPage
      _storage.remove('user_uid');
      Get.offAll(() => const AuthPage());
    } catch (e) {
      print('Error during logout: $e');
      rethrow; // Re-throw any exceptions for handling
    }
  }
}
