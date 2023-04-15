import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final String name;
  final int age;

  const MyWidget({super.key, required this.name, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Мій віджет')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Привіт, $name!'),
            Text('Тобі $age років.'),
          ],
        ),
      ),
    );
  }
}
