import 'package:image_picker/image_picker.dart';

class PickImages {
  pickImageFromGallery() async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? imagefile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (imagefile != null) {
      return await imagefile.readAsBytes();
    }
    print('No Image selected');
  }
}