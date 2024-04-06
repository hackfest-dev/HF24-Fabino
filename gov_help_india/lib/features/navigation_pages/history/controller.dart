import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gov_help_india/services/api/api_handler.dart';

class HistoryController extends GetxController{
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    final _storage = GetStorage();
    print(_storage.read("user_uid"));

    print(await ApiHandler.getHistory());

  }
}