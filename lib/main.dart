import 'package:flutter/material.dart';
import 'my_name_lastname.dart';

void main() {
  runApp(const MyToggleButton());
}

class MyToggleButton extends StatefulWidget {
  const MyToggleButton({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyToggleButtonState();
  }
}

class MyToggleButtonState extends State<MyToggleButton> {
  final MyNameLastName person =
      MyNameLastName(name: 'Nazar', lastName: 'Kryzhanivsky');
  String textHolder = 'Press button to see my Name and Lastname';
  void clickFunction() {
    setState(() {
      textHolder = 'Name: ${person.name}, LastName: ${person.lastName}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nazar Kryzhanivsky Title',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nazar Kryzhanivsky Title'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  clickFunction();
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20.0)),
                child: const Text('Press'),
              ),
              Text(
                textHolder,
                style: const TextStyle(fontSize: 21),
              )
            ],
          ),
        ),
      ),
    );
  }
}
