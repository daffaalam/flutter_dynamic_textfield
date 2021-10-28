import 'package:flutter/material.dart';

import '../example1/example_page.dart' as example1;
import '../example2/example_page.dart' as example2;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic TextField'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Example 1'),
            subtitle: const Text('insert and remove some TextField'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const example1.ExamplePage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Example 2'),
            subtitle: const Text('insert data JSON to TextField'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const example2.ExamplePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
