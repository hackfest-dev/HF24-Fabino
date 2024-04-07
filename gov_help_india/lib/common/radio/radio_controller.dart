import 'package:get/get.dart';

class DialogController extends GetxController {
  var selectedRadio = 0.obs; // Use Rx variable for reactive updates

  void setSelectedRadio(int value) {
    selectedRadio.value = value;
  }
}
