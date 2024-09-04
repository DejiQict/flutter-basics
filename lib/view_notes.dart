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
      'Groceries',
      'Tomatoes, Rice, Peas, Beans',
      'https://media.istockphoto.com/id/639201180/nl/vector/shopping-cart-icon.jpg?s=612x612&w=0&k=20&c=i9Ql8NjGC94vMvQuMmOenbanZDOC0QJb4R8S_VhOoz4='
    ],
    2: <String?>[
      'Office Supplies',
      'Pens, Pencils, Staplers',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmIj_XV0gXQnqvgVy0NXp-iWEbaiLCwLLNZw&s'
    ],
  };

  @override
  void initState() {
    // For fetching data (api, database calls)
    super.initState();
    singleton.addName('Deji');
    if (kDebugMode) {
      //Only prints in the debug mode not production
      print(notes[1]?[0]);
    }
  }

  Map<int, List<String?>> getNotes() {
    return notes;
  }

  List<String?> getTitles() {
    List<String?> titles = <String?>[];
    notes.forEach((int key, List<String?> value) {
      titles.add(value[0]);
    });
    return titles;
  }

  void createNote(String title, String list, String image) {
    notes[notes.length + 1] = [image, list, image];
  }

  void deleteNote(int key) {
    notes.remove(key);
  }

  (String?, String?, String?) getDetails(int key) {
    String? title = getNotes()[key]?[0];
    String? list = getNotes()[key]?[1];
    String? image = getNotes()[key]?[2];

    return (title, list, image);
  }

  @override
  Widget build(BuildContext context) {
    //Use this to fill the text field
    if (kDebugMode) {
      print(singleton.printName());
    }

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
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(color: Colors.black),
                      backgroundColor: const Color.fromARGB(255, 90, 255, 101),
                    ),
                    onPressed: onPressed,
                    child: const Text('Create Note')),
              ],
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: const Color.fromARGB(255, 254, 244, 207),
              // makes all items show on page due infinite page size
              child: ListView(
                children: notes.keys.map((int key) {
                  String? title = notes[key]?[0];
                  return SizedBox(
                    // Make this generate for each item of the remaining page. Also look at how to define page colour
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 254, 244, 207),
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 129, 180, 227),
                                  width: 1.3))),
                      child: Row(
                        // Row for notes content, try generative feature based on each article in notes

                        children: <Widget>[
                          Text(
                            title!,
                            style: const TextStyle(
                                fontSize: 30.00,
                                color: Color.fromARGB(25, 30, 24, 23)),
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
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 90, 90),
                              ),
                              onPressed: () => deletePressed(context, key),
                              child: const Text('Delete Note')),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  void onPressed() {}
  void CreatePressed() {}

  Future<void> deletePressed(BuildContext context, int key) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete!'),
          titleTextStyle: TextStyle(color: Color.fromARGB(255, 227, 134, 129)),
          content: const Text(
            'Are you sure?\n',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Yes'),
              onPressed: () {
                setState(() {
                  // Important to refresh UI after action
                  deleteNote(key);
                });
                print(notes);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
