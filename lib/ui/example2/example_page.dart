import 'package:flutter/material.dart';

import '../../model/dummy_data.dart';
import '../../model/quiz.dart';
import 'example_dialog.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final List<TextField> _listField = <TextField>[];
  final List<Quiz> _listQuiz = DummyData.listData;

  @override
  void initState() {
    super.initState();
    for (Quiz item in _listQuiz) {
      _listField.add(
        TextField(
          controller: TextEditingController(
            text: item.answer,
          ),
          decoration: InputDecoration(
            labelText: item.title,
            hintText: item.question,
            border: const OutlineInputBorder(),
          ),
          onChanged: (String value) {
            item.answer = value;
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example 2'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _listField[index],
          );
        },
        itemCount: _listField.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.done),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const ExampleDialog();
            },
            routeSettings: RouteSettings(
              arguments: _listQuiz,
            ),
          );
        },
      ),
    );
  }
}
