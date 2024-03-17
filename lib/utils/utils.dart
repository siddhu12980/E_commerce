import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

pickimage(ImageSource source) async {
  final ImagePicker imagepicker = ImagePicker();

  XFile? file = await imagepicker.pickImage(source: source);

  if (file != null) {
    return await file.readAsBytes();
  }

  if (kDebugMode) {
    print('No images selected');
  }
}
