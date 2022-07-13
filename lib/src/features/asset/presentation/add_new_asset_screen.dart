import 'dart:io';
import 'dart:typed_data';

import 'package:asset_split/src/common_widget/alert_dialog_widget.dart';
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
import '../domain/value/priod.dart';

class AddNewAssetScreen extends ConsumerStatefulWidget {
  const AddNewAssetScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      AddNewAssetScreenState();
}

class AddNewAssetScreenState extends ConsumerState<AddNewAssetScreen> {
  // late String name;
  Uint8List? image;
  // late int cost;
  // late int priod;
  final nameController = TextEditingController();
  final costController = TextEditingController();
  final periodController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              // onChanged: (value) {
              //   name = value;
              // },
              decoration: kInputTextDecoration.copyWith(hintText: 'アイテム名'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: costController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: kInputTextDecoration.copyWith(hintText: '金額'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: periodController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              // onChanged: (value) {
              //   priod = int.tryParse(value) ?? 0;
              // },
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
                  Uint8List pickImage = byte.buffer.asUint8List();
                  setState(
                    () {
                      print('call setstate');
                      image = pickImage;
                    },
                  );
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
            (image != null)
                ? Container(
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: Image.memory(image!).image,
                      ),
                    ),
                  )
                : Container(),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              onPressed: () async {
                try {
                  if (costController.text.isEmpty) {
                    throw Exception('cost error');
                  }
                  if (periodController.text.isEmpty) {
                    throw Exception('period error');
                  }
                  ref.read(assetStateProvider.notifier).add(
                        name: AssetName(assetName: nameController.text),
                        image: image!,
                        cost: Money(int.tryParse(costController.text)!),
                        period: Period(int.tryParse(periodController.text)!),
                      );
                  Navigator.of(context).pop();
                } catch (e) {
                  print(e);
                  showDialog(
                      context: context,
                      builder: (_) {
                        return const AlertDialogWidget(message: '入力にエラーがあります');
                      });
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
