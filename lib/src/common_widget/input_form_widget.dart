import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import '../constants.dart';

class InputFormWidget extends StatefulWidget {
  const InputFormWidget({
    Key? key,
    required this.nodeText,
    required this.inputController,
    required this.textInputType,
    required this.textInputFormatter,
    required this.hintText,
  }) : super(key: key);

  final FocusNode nodeText;
  final TextEditingController inputController;
  final TextInputType textInputType;
  final TextInputFormatter textInputFormatter;
  final String hintText;

  @override
  State<InputFormWidget> createState() => _InputFormWidgetState();
}

class _InputFormWidgetState extends State<InputFormWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      // padding: const EdgeInsets.all(5),
      child: KeyboardActions(
        config: buildConfig(context),
        child: Center(
          child: TextField(
            controller: widget.inputController,
            decoration:
                kInputTextDecoration.copyWith(hintText: widget.hintText),
            keyboardType: widget.textInputType,
            inputFormatters: <TextInputFormatter>[widget.textInputFormatter],
            focusNode: widget.nodeText,
          ),
        ),
      ),
    );
  }

  KeyboardActionsConfig buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(focusNode: widget.nodeText, toolbarButtons: [
          (node) {
            return GestureDetector(
              onTap: () => node.unfocus(),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: const [
                    Text(
                      'Done',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
            );
          }
        ]),
      ],
    );
  }
}
