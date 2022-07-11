import 'dart:io';
import 'dart:typed_data';

import 'package:asset_split/src/features/asset/presentation/asset_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../constants.dart';
import '../../user/domain/value/money_amount.dart';
import '../domain/value/asset_name.dart';

class AddNewAssetScreen extends ConsumerWidget {
  late String name;
  late Uint8List image;
  late int cost;
  late int priod;

  AddNewAssetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'アイテム追加',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                name = value;
              },
              decoration: kInputTextDecoration.copyWith(hintText: 'アイテム名'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                cost = int.tryParse(value) ?? 0;
              },
              decoration: kInputTextDecoration.copyWith(hintText: '金額'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                priod = int.tryParse(value) ?? 0;
              },
              decoration: kInputTextDecoration.copyWith(hintText: '償却期間(何ヶ月？）'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              onPressed: () async {
                try {
                  ImagePicker? imagePicker = ImagePicker();
                  final XFile? pickedFile =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  final path = (await getApplicationDocumentsDirectory()).path;
                  final String fileName = basename(pickedFile!.path);
                  final String imagePath = '$path/$fileName';
                  File imageFile = File(imagePath);
                  await imageFile.writeAsBytes(await pickedFile.readAsBytes());
                  ByteData byte = await rootBundle.load(imagePath);
                  image = byte.buffer.asUint8List();
                } catch (e) {
                  print(e);
                }
              },
              child: const Text(
                'image選択',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              onPressed: () async {
                try {
                  ref.read(assetStateProvider.notifier).add(
                        name: AssetName(assetName: name),
                        image: image,
                        cost: Money(amount: cost),
                        priod: priod,
                      );
                } catch (e) {
                  print(e);
                }
              },
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
