import 'dart:io';
import 'dart:typed_data';

import 'package:asset_split/src/common_widget/alert_dialog_widget.dart';
import 'package:asset_split/src/common_widget/input_form_widget.dart';
import 'package:asset_split/src/features/asset/presentation/asset_controller.dart';
import 'package:asset_split/src/features/user/presentation/current_user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

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
  Uint8List? image;
  final nameController = TextEditingController();
  final costController = TextEditingController();
  final periodController = TextEditingController();

  final FocusNode nodeText1 = FocusNode();
  final FocusNode nodeText2 = FocusNode();
  final FocusNode nodeText3 = FocusNode();

  @override
  Widget build(BuildContext context) {
    final currentUserId = ref.watch(currentUserStateProvider).value;
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
            InputFormWidget(
              nodeText: nodeText1,
              inputController: nameController,
              textInputType: TextInputType.text,
              textInputFormatter:
                  FilteringTextInputFormatter.singleLineFormatter,
              hintText: '名前',
            ),
            InputFormWidget(
              nodeText: nodeText2,
              inputController: costController,
              textInputType: TextInputType.number,
              textInputFormatter: FilteringTextInputFormatter.digitsOnly,
              hintText: '金額',
            ),
            InputFormWidget(
              nodeText: nodeText3,
              inputController: periodController,
              textInputType: TextInputType.number,
              textInputFormatter: FilteringTextInputFormatter.digitsOnly,
              hintText: '使用期間',
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
                  ref.read(assetControllerProvider.notifier).add(
                        userId: currentUserId ?? 0,
                        name: AssetName(assetName: nameController.text),
                        image: image!,
                        cost: Money(double.tryParse(costController.text)!),
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
