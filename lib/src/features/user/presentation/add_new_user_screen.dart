import 'package:asset_split/src/features/user/presentation/current_user_state.dart';
import 'package:asset_split/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common_widget/alert_dialog_widget.dart';
import '../../../common_widget/input_form_widget.dart';
import '../domain/value/user_name.dart';

class AddNewUserScreen extends ConsumerStatefulWidget {
  const AddNewUserScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewUserScreenState();
}

class _AddNewUserScreenState extends ConsumerState<AddNewUserScreen> {
  final nameController = TextEditingController();

  final FocusNode nodeText1 = FocusNode();

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
            InputFormWidget(
              nodeText: nodeText1,
              inputController: nameController,
              textInputType: TextInputType.text,
              textInputFormatter:
                  FilteringTextInputFormatter.singleLineFormatter,
              hintText: '名前',
            ),
            const SizedBox(
              height: 10,
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
                  if (nameController.text.isEmpty) {
                    throw Exception('user name error');
                  }
                  ref.read(currentUserStateProvider.notifier).addNewUser(
                        name: UserName(name: nameController.text),
                      );
                  Navigator.of(context).pop();
                  context.goNamed(AppRoute.user.name);
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
