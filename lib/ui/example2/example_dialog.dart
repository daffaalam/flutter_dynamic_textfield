import 'package:flutter/material.dart';

import '../../model/quiz.dart';

class ExampleDialog extends StatelessWidget {
  const ExampleDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Object? arguments = ModalRoute.of(context)?.settings.arguments;
    List<Quiz> listData = <Quiz>[];
    if (arguments is List<Quiz>) listData = arguments;
    return Dialog(
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(listData[index].question),
            subtitle: Text(listData[index].answer ?? ''),
          );
        },
        itemCount: listData.length,
      ),
    );
  }
}
