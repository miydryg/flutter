import 'package:first_project_flutter_start/widgets/name_age.dart';
import 'package:first_project_flutter_start/widgets/name_class.dart';
import 'package:first_project_flutter_start/widgets/named_route.dart';
import 'package:first_project_flutter_start/widgets/show_pepe.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PreviousScreen(),
      initialRoute: '/',
      routes: {
        '/named_route': (context) => const NamedRoute(),
      },
    );
  }
}

class PreviousScreen extends StatefulWidget {
  const PreviousScreen({super.key});

  @override
  _PreviousScreenState createState() => _PreviousScreenState();
}

class _PreviousScreenState extends State<PreviousScreen> {
  late String _returnedValue =
      'цей текст зміниться на текст повернений з віджета';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('100 тисяч навігацій'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(14.0),
            ),
            ListTile(
              leading: const Hero(
                tag: 'hero-rectangle',
                child: Image(
                    image: NetworkImage(
                        'https://i1.sndcdn.com/avatars-000620693316-ukl0j7-t500x500.jpg')),
              ),
              onTap: () {},
              title: const Text(
                'Kaneki Ken',
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Перехід на віджет по імені класу'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NameClass(anotherName: 'qQwert', anotherAge: 144,)),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Перехід на віджет по "іменованій навігації'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/named_route',
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Передача параметрів у віджет, який буде відкрито (через конструктор)'),
              onTap: () { Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyWidget(name: 'Василь', age: 30)),
              );},
            ),

            ListTile(
              leading: const Icon(Icons.houseboat_rounded),
              title: const Text('Повернення параметрів назад при виході з віджета'),
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShowPepe()),
                );
                setState(() {
                  _returnedValue = result;
                });
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Перехід на віджет по імені класу'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NameClass(anotherName: 'qwe', anotherAge: 355,)),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/named_route',
                );
              },
              child: const Text('Перехід на віджет по "іменованій навігації'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyWidget(name: 'Василь', age: 30)),
                );
              },
              child: const Text(
                  'Передача параметрів у віджет, який буде відкрито (через конструктор) '),
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShowPepe()),
                );
                setState(() {
                  _returnedValue = result;
                });
              },
              child: const Text('Повернення параметрів назад при виході з віджета '),
            ),
            Text(_returnedValue),
          ],
        ),
      ),
    );
  }
}
