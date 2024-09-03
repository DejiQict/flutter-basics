import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_notes.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', //Title in top bar
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(0, 252, 255, 215),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'), //For initial route
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
  int _counter = 0;
  
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

   @override
  void initState() {// For fetching data (api, database calls)
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold( // Remove Const
      
      body: ViewPage(),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
