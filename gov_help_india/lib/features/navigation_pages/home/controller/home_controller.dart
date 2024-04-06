import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../services/api/api_handler.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final Rx<int> selectedFilter = 0.obs;

  final filterItems = ["All", "General", "Road", "Electricity", "Water"];
  final _storage = GetStorage();
  late Rx<String?> area = "".obs;
  final issues = [].obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    final location = await Geolocator.getCurrentPosition();
    area.value = await ApiHandler.getStateFromLatLong(location.latitude, location.longitude);
    await getNearbyIssues();
  }

  Future<void> getNearbyIssues() async {
    final issuesResponse = await ApiHandler.getFilteredIssue();
    issues.value = issuesResponse?["filtered_issues"];
    update();
    print(issues.value);
  }

  void onFilterButtonClick(int index) {
    selectedFilter.value = index;
    update();
  }
}
