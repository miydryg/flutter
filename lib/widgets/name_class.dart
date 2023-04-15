import 'package:flutter/material.dart';

import 'name_age.dart';


class NameClass extends StatelessWidget {
  const NameClass({Key? key, required this.anotherName, required this.anotherAge}) : super(key: key);
 final String anotherName;
  final int anotherAge;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyWidget(name: anotherName, age: anotherAge,),
    );
  }
}
