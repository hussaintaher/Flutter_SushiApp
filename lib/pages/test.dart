import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page'),
      ),
      body: Container(
        child: Column(
          children: [
            ListTile(
              title: Text('Hello'),
              subtitle: Text('0540461617'),
            )
          ],
        ),
      ),
    );
  }
}