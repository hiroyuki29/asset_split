import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:asset_split/src/common_widget/alert_dialog_widget.dart';
import 'package:asset_split/src/common_widget/input_form_widget.dart';
import 'package:asset_split/src/features/asset/presentation/asset_list_screen.dart';
import 'package:asset_split/src/features/user/presentation/current_user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../user/domain/value/money_amount.dart';
import '../domain/value/asset_name.dart';
import '../domain/value/priod.dart';
import '../use_case/asset_use_case.dart';

class AddNewAssetScreen extends ConsumerStatefulWidget {
  const AddNewAssetScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      AddNewAssetScreenState();
}

class AddNewAssetScreenState extends ConsumerState<AddNewAssetScreen> {
  Uint8List? image;
  // int allPeriod;
  int years = 0;
  int months = 0;
  int days = 0;
  final nameController = TextEditingController();
  final costController = TextEditingController();

  final FocusNode nodeText1 = FocusNode();
  final FocusNode nodeText2 = FocusNode();

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
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 48,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.lightBlueAccent, width: 1.0),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextForPeriod(
                      year: years,
                      month: months,
                      day: days,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                      onPressed: () async {
                        // (BuildContext context) {
                        Picker(
                            adapter: PickerDataAdapter<String>(
                              pickerdata:
                                  const JsonDecoder().convert(pickerData2),
                              isArray: true,
                            ),
                            hideHeader: true,
                            selecteds: [0, 0, 0],
                            title: const Text("返済期間:年-月-日"),
                            selectedTextStyle:
                                const TextStyle(color: Colors.blue),
                            onConfirm: (Picker picker, List value) {
                              setState(() {
                                years = value[0];
                                months = value[1];
                                days = value[2];
                              });
                            }).showDialog(context);
                      },
                      child: const Text(
                        '期間選択',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                (image != null)
                    ? Expanded(
                        flex: 7,
                        child: Center(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: Image.memory(image!).image,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const Expanded(
                        flex: 7,
                        child: SizedBox(
                          child: Center(child: Text('No Image')),
                        )),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: SizedBox(
                      // width: 100,
                      height: 40,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                        ),
                        onPressed: () async {
                          try {
                            ImagePicker? imagePicker = ImagePicker();
                            final XFile? pickedFile = await imagePicker
                                .pickImage(source: ImageSource.gallery);
                            final path =
                                (await getApplicationDocumentsDirectory()).path;
                            final String fileName = basename(pickedFile!.path);
                            final String imagePath = '$path/$fileName';
                            File imageFile = File(imagePath);
                            await imageFile
                                .writeAsBytes(await pickedFile.readAsBytes());
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
                    ),
                  ),
                ),
              ],
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
                  if (costController.text.isEmpty) {
                    throw Exception('cost error');
                  }
                  if (years == 0 && months == 0 && days == 0) {
                    throw Exception('period error');
                  }
                  ref.read(assetUseCaseProvider).add(
                        userId: currentUserId ?? 0,
                        name: AssetName(assetName: nameController.text),
                        image: image!,
                        cost: Money(double.tryParse(costController.text)!),
                        period: Period(year: years, month: months, day: days),
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

const pickerData2 = '''
[
    [
        0,
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
        15,
        16,
        17,
        18,
        19,
        20
    ],
    [
        0,
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12
    ],
    [
        0,
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
        15,
        16,
        17,
        18,
        19,
        20,
        21,
        22,
        23,
        24,
        25,
        26,
        27,
        28,
        29,
        30
    ]
]
    ''';
