import 'dart:convert';
import 'package:first_project_flutter_start/provider/theme_settings.dart';
import 'package:first_project_flutter_start/screens/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'json/photo.dart';


Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  return compute(parsePhotos, response.body);
}


List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final isDark = sharedPreferences.getBool('is_dark') ?? false;
  runApp( MyApp(isDark: isDark,));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  const MyApp({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeSettings(isDark),
      builder: (context, snapshot) {
        final settings = Provider.of<ThemeSettings>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: settings.currentTheme,
          home: const MyHomePage(),
        );
      }
    );
  }
}

