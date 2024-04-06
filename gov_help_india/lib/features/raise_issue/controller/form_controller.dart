import 'package:get/get.dart';

class FormController extends GetxController {
  static FormController get instance => Get.find();

  final selectedCategory = 'Traffic'.obs;
  final title = ''.obs;
  final description = ''.obs;
  final RxString imageUrl = "".obs;
  final dropDown = ['Traffic',
    'Road',
    'Water',
    'Electricity',
    'General',];

  // Validation function
  String? validate(String? value) {
    if (value!.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
