import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/user.dart';
import 'package:flutter_application_1/view_notes.dart';

void main() {
  runApp(const MyApp());
  MySingleton singleton = MySingleton();
  singleton.addName("Deji");
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', //Title in top bar
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 16, 158, 71)),
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
    Map<int, List> notes = HashMap();

    notes = {
      1: ["groceries", "Tomatoes, Rice, Peas, Beans", "https://media.istockphoto.com/id/639201180/nl/vector/shopping-cart-icon.jpg?s=612x612&w=0&k=20&c=i9Ql8NjGC94vMvQuMmOenbanZDOC0QJb4R8S_VhOoz4="],
      2: ["office Supplies", "Pens, Pencils, Staplers", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmIj_XV0gXQnqvgVy0NXp-iWEbaiLCwLLNZw&s"]
      };

    print(notes[1]?[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ViewPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
