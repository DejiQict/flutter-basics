// ignore_for_file: use_colored_box

import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'user.dart';

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

  MySingleton singleton = MySingleton();
  Map<int, List<String?>> notes = <int, List<String?>>{
    1: <String?>[
      'groceries',
      'Tomatoes, Rice, Peas, Beans',
      'https://media.istockphoto.com/id/639201180/nl/vector/shopping-cart-icon.jpg?s=612x612&w=0&k=20&c=i9Ql8NjGC94vMvQuMmOenbanZDOC0QJb4R8S_VhOoz4='
    ],
    2: <String?>[
      'office Supplies',
      'Pens, Pencils, Staplers',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmIj_XV0gXQnqvgVy0NXp-iWEbaiLCwLLNZw&s'
    ]
  };

  @override
  void initState() {
    // For fetching data (api, database calls)
    super.initState();

    if (kDebugMode) {
      //Only prints in the debug mode not production
      print(notes[1]?[0]);
    }
  }

  List<String?> getTitles() {
    List<String?> titles = <String?>[];
    notes.forEach((int key, List<String?> value) {
      titles.add(value[0]);
    });
    return titles;
  }

  @override
  Widget build(BuildContext context) {
    // can go in initstate, build and
    singleton.addName('Deji'); //Use this to fill the text field
    if (kDebugMode) {
      print(singleton.printName());
    }

    List<String?> titles = getTitles();

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            // Row for header
            color: const Color(0xFFE3D081),
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: <Widget>[
                Text(
                  singleton.printName(),
                  style: const TextStyle(
                      fontSize: 30.00,
                      color: Color.fromARGB(255, 5, 5, 5),
                      fontStyle: FontStyle.italic),
                ),
                const Spacer(),
                ElevatedButton(
                    onPressed: onPressed, child: const Text('Create Note'))
              ],
            ),
          ),
          SizedBox(
            // Make this generate for each item of the remaining page. Also look at how to define page colour
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 254, 244, 207),
                  border: Border(
                      bottom:
                          BorderSide(color: Color(0xFFE3D081), width: 3.0))),
              child: Row(
                // Row for notes content, try generative feature based on each article in notes

                children: <Widget>[
                  Text(
                    titles[0]!,
                    style: const TextStyle(
                        fontSize: 30.00, color: Color.fromARGB(25, 30, 24, 23)),
                  ),
                  const Spacer(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 233, 90),
                      ),
                      onPressed: onPressed,
                      child: const Text('Edit Note')),
                  const Spacer(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 90, 90),
                      ),
                      onPressed: onPressed,
                      child: const Text('Delete Note')),
                ],
              ),
            ),
          ),
          SizedBox(
            // Make this generate for each item of the remaining page. Also look at how to define page colour
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 254, 244, 207),
                  border: Border(
                      bottom:
                          BorderSide(color: Color(0xFFE3D081), width: 3.0))),
              child: Row(
                // Row for notes content, try generative feature based on each article in notes

                children: <Widget>[
                  Text(
                    titles[1]!,
                    style: const TextStyle(
                        fontSize: 30.00, color: Color.fromARGB(25, 30, 24, 23)),
                  ),
                  const Spacer(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 233, 90),
                      ),
                      onPressed: onPressed,
                      child: const Text('Edit Note')),
                  const Spacer(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 90, 90),
                      ),
                      onPressed: onPressed,
                      child: const Text('Delete Note')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPressed() {}
}
