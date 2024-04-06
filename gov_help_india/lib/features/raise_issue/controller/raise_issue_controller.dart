import 'dart:ffi';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gov_help_india/features/raise_issue/controller/form_controller.dart';
import 'package:gov_help_india/features/raise_issue/model/UserIssue.dart';
import 'package:gov_help_india/services/api/api_handler.dart';
import 'package:image_picker/image_picker.dart';

class RaiseIssueController extends GetxController {
  static RaiseIssueController get instance => Get.find();

  final _imageFile = Rx<File?>(null);
  final _storage = GetStorage();
  final FormController _formController = Get.put(FormController());



  File? get imageFile => _imageFile.value;

  void pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: source);
    try{
      if (pickedFile != null) {
        _imageFile.value = File(pickedFile.path);
        final byte = await pickedFile.readAsBytes();
        // Construct the file name for Firebase Storage
        String fileName = "${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";

        // Get a reference to the root of the Firebase Storage
        Reference referenceRoot = FirebaseStorage.instanceFor(bucket: "gs://hackfest-c8599.appspot.com").ref();

        // Get a reference to the directory for the current user
        Reference refDir = referenceRoot.child(_storage.read("user_uid"));

        // Get a reference to the file with the constructed file name
        Reference refFile = refDir.child(fileName);


        // Upload the file to Firebase Storage
        TaskSnapshot snap = await refFile.putData(byte);
        print(snap.state);
        // Get the download URL of the uploaded file
        _formController.imageUrl.value = await refFile.getDownloadURL();
      }
    } catch (e) {
      print(e);
    }

  }

  Future<void> raiseIssue() async {

    final dynamic location = _storage.read("location");
    ApiHandler.postNewIssue(
        UserIssue(userId: _storage.read("user_uid").toString(),
            title: _formController.title.value,
            description: _formController.description.value,
            imageUrl: _formController.imageUrl.value,
            latitude: location["latitude"],
            longitude: location["longitude"],
            category: _formController.selectedCategory.value, supportCount: 0, reportCount: 0)
    );
  }
}
