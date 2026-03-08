import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

// Run | Debug | Profile
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String textFromFile = 'Vacío';

  getData() async {
    String response;
    response = await rootBundle.loadString('archivos_texto/mis_apuntes.txt');

    setState(() {
      textFromFile = response;
    });
  }

  clear() {
    setState(() {
      textFromFile = 'Vacío';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              textFromFile,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            ElevatedButton(
              onPressed: () {
                getData();
              },
              child: const Text('Get data'),
            ),

            ElevatedButton(
              onPressed: () {
                clear();
              },
              child: const Text('clear'),
            ),

          ],
        ),
      ),
    );
  }
}