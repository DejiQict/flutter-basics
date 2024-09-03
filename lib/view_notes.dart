import 'dart:collection';

import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  int _counter = 0;
  
  

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
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
      
      // body: Center(
      //   // Center is a layout widget. It takes a single child and positions it
      //   // in the middle of the parent.
      //   child: Column(
          
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headlineMedium,
      //       ),
      //     ],
      //   ),
      // ),
      body: GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(2, (index) {
        return Center(
          child: Text(
            'Item $index',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        );
      }),
      ),
      

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
