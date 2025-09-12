import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageService {
  static Future<String?> pickAndSaveImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return null;

    final File tempImage = File(pickedFile.path);

    // انسخ الصورة لمكان دائم (Documents Directory)
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = DateTime.now().millisecondsSinceEpoch.toString() +
        "_" +
        pickedFile.name;
    final savedImage = await tempImage.copy('${appDir.path}/$fileName');

    // خزّن المسار في SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("imagePath", savedImage.path);

    return savedImage.path;
  }
}
