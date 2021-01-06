import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelector {
  Future<File> selectImage() async {
    var imagePicker = await ImagePicker().getImage(source: ImageSource.gallery);
    // return await imagePicker.getImage(source: ImageSource.gallery);
    if (imagePicker != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: imagePicker.path,
          aspectRatio: CropAspectRatio(ratioX: 16, ratioY: 9),
          compressQuality: 100,
          maxHeight: 300,
          maxWidth: 700,
          compressFormat: ImageCompressFormat.jpg);
      return cropped;
    } else {
      return null;
    }
  }
}
