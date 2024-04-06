import 'dart:io';

import 'package:image_picker/image_picker.dart';

class THandleImageImport {

  static Future<File?> getImageFromDevice(ImageSource source) async{
      final image = await ImagePicker().pickImage(source: source);
      if(image == null){
        return null;
      }
      final imagePath = File(image.path);
      return imagePath;
  }
}