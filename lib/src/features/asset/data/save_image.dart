import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveAndReadImage {
  static Future saveLocalImage(XFile image) async {
    final path = await localPath;
    final String fileName = basename(image.path);
    final imagePath = '$path/$fileName';
    sharedPrefWrite(fileName);
    File imageFile = File(imagePath);
    var saveFile = await imageFile.writeAsBytes(await image.readAsBytes());
    return saveFile;
  }

  static Future get localPath async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = appDocDir.path;
    return path;
  }

  static Future sharedPrefWrite(imagePath) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('key', imagePath);
  }

  static Future<Uint8List> sharedPrefRead() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? fileName = prefs.getString('key');
    try {
      if (fileName == null) {
        throw Exception('no image');
      }
      String nowDocumentPath = (await getApplicationDocumentsDirectory()).path;
      String imagePath = '$nowDocumentPath/$fileName';
      ByteData byte = await rootBundle.load(imagePath);
      final Uint8List list = byte.buffer.asUint8List();
      return list;
    } catch (e) {
      print(e);
      return Uint8List(8);
    }
  }
}
