import 'package:flutter/material.dart';

class ExampleDialog extends StatelessWidget {
  const ExampleDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Object? arguments = ModalRoute.of(context)?.settings.arguments;
    List<String> listData = <String>[];
    String data = '\n';
    if (arguments is List<String>) listData = arguments;
    for (int i = 0; i < listData.length; i++) {
      data += 'Item ${i + 1} = ${listData[i]}\n';
    }
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(data),
      ),
    );
  }
}
