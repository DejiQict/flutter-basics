// ignore_for_file: use_colored_box

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
    notes[notes.length + 1] = <String?>[title, list, image];
  }

  void deleteNote(int key) {
    notes.remove(key);
  }

  void editNote(int key, String title, String note, String image) {
    notes[key] = <String>[title, note, image];
  }

  (String?, String?, String?) getDetails(int key) {
    //fix to call once and assign to local variables in function
    String? title = getNotes()[key]?[0];
    String? note = getNotes()[key]?[1];
    String? image = getNotes()[key]?[2];

    return (title, note, image);
  }

  void _incrementCounter() {
    setState(() {
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
      print(notes.length);
    }
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
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(color: Colors.black),
                      backgroundColor: const Color.fromARGB(255, 90, 255, 101),
                    ),
                    onPressed: () => createPressed(context),
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
                  final String? title = notes[key]?[0];
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
                                color: Color.fromARGB(25, 30, 24, 23),
                                fontStyle: FontStyle.italic,
                                fontFamily: ''),
                          ),
                          Spacer(),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 233, 90),
                              ),
                              onPressed: () => editPressed(context, key),
                              child: const Text('Edit Note')),
                          const SizedBox(
                            width: 5.0,
                          ),
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
  final TextEditingController title = TextEditingController();
  final TextEditingController note = TextEditingController();
  final TextEditingController image = TextEditingController();

  Future<void> deletePressed(BuildContext context, int key) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete!'),
          titleTextStyle:
              const TextStyle(color: Color.fromARGB(255, 227, 134, 129)),
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

  Future<void> createPressed(BuildContext context) async {
    final TextEditingController title = TextEditingController();
    final TextEditingController note = TextEditingController();
    final TextEditingController image = TextEditingController();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFE3D081),
          title: const Text('Create note'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Title'),
                TextField(
                  controller: title,
                ),
                const Text('Note'),
                TextField(
                  controller: note,
                ),
                const Text('Image'),
                TextField(controller: image),
              ],
            ),
          ),
          actions: <Widget>[
            // Add validation to make sure all fields are filled maybe if not, the item is not created. if title is filled, create the note regardless
            TextButton(
                child: const Text('Add'),
                onPressed: () {
                  setState(() {
                    // Important to refresh UI after action
                    if (title.text != '') {
                      // make sure that topic is filled else don't create it
                      createNote(title.text, note.text, image.text);
                      Navigator.of(context).pop();
                    }
                  });
                }),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> editPressed(BuildContext context, int key) async {
    // call once
    title.text = getDetails(key).$1!; // text vs value
    note.text = getDetails(key).$2!;
    image.text = getDetails(key).$3!;

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFE3D081),
          title: const Text('Create note'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Title'),
                TextField(
                  controller: title,
                ),
                const Text('Note'),
                TextField(
                  //make the textfield keep expanding with more texts for multiline
                  controller: note,
                  // keyboardType: TextInputType.multiline,
                  // maxLines: null,
                  // minLines: 4,
                ),
                const Text('Image'),
                TextField(controller: image),
              ],
            ),
          ),
          actions: <Widget>[
            // Account for list overflow
            TextButton(
                child: const Text('Edit'),
                onPressed: () {
                  setState(() {
                    // Important to refresh UI after action
                    if (title.text != '') {
                      // make sure that topic is filled else don't create it
                      editNote(key, title.text, note.text, image.text);
                      Navigator.of(context).pop();
                    }
                  });
                }),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
