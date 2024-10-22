import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ItemController extends GetxController{

  ///image picker code for picture ...........
  var imagePath = '';
  final ImagePicker picker = ImagePicker();
  void pickedImage(ImageSource imgCam) async {
    final XFile? image = await picker.pickImage(source: imgCam);
    imagePath = image!.path;
    update(['imgPathUpdate']);
  }
}