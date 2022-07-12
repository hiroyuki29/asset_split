import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(message),
      actions: [
        GestureDetector(
          child: const Text('close'),
          onTap: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
