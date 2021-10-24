import 'package:flutter/material.dart';

import 'home_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TextEditingController> _listController = <TextEditingController>[];

  @override
  void initState() {
    super.initState();
    _listController.insert(0, TextEditingController());
  }

  @override
  void dispose() {
    for (TextEditingController controller in _listController) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic TextField'),
        actions: <Widget>[
          IconButton(
            onPressed: _sendData,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: _textField(index),
            ),
          );
        },
        itemCount: _listController.length,
      ),
    );
  }

  void _sendData() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const HomeDialog();
      },
      routeSettings: RouteSettings(
        arguments: _listController.map<String>(
          (TextEditingController controller) {
            return controller.text;
          },
        ).toList(),
      ),
    );
  }

  List<Widget> _textField(int index) {
    int number = index + 1;
    return <Widget>[
      Expanded(
        child: TextField(
          controller: _listController[index],
          decoration: InputDecoration(
            labelText: 'TextField $number',
            border: const OutlineInputBorder(),
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          _listController.insert(number, TextEditingController());
          setState(() {});
        },
        icon: const Icon(Icons.add),
      ),
      if ((index + 1) != _listController.length)
        IconButton(
          onPressed: () {
            _listController.removeAt(index);
            setState(() {});
          },
          icon: const Icon(Icons.remove),
        ),
    ];
  }
}
