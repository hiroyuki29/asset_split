import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../data/save_image.dart';

class AssetHomeScreen extends StatefulWidget {
  const AssetHomeScreen({Key? key}) : super(key: key);

  @override
  State<AssetHomeScreen> createState() => _AssetHomeScreenState();
}

class _AssetHomeScreenState extends State<AssetHomeScreen> {
  File? imageFile;
  ImagePicker? imagePicker;

  @override
  void initState() {
    super.initState();
    SaveAndReadImage.sharedPrefRead();
    imagePicker = ImagePicker();
  }

  _imgFromGallery() async {
    final XFile? pickedFile =
        await imagePicker?.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return;
    }
    var savedFile = await SaveAndReadImage.saveLocalImage(pickedFile);
    setState(() {
      imageFile = savedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asset split'),
      ),
      body: Column(
        children: [
          Center(
            child: FutureBuilder(
              future: SaveAndReadImage.sharedPrefRead(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData == true) {
                  Uint8List image = snapshot.data;
                  print(snapshot.hasError);
                  return Center(
                    child: Image.memory(
                      image,
                      scale: 1.0,
                    ),
                  );
                } else {
                  Container();
                }
                return const Text('sorry');
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _imgFromGallery();
        },
      ),
    );
  }
}
