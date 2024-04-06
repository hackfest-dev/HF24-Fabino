import 'package:get/get.dart';
import 'package:gov_help_india/common/snackbar/snackbars.dart';
import 'package:gov_help_india/services/repository/auth_repo.dart';

class AuthController extends GetxController{

  Future<void> signInGoogle() async {
    try{
      final authentication = AuthenticationRepository.instance.signInWithGoogle();
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh snap", message: e.toString());
    }
  }

}