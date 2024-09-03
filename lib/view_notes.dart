import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/user.dart';

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

    if (kDebugMode) { //Only prints in the debug mode not production
      print(notes[1]?[0]);
    }

    
   
  }

  @override
  Widget build(BuildContext context) {
     MySingleton singleton = MySingleton(); // can go in initstate, build and 
    singleton.addName("Deji");
    print(singleton.printName());
    
    return Scaffold(
      
      body: Column(
        children: [
          Container( // Row for header
            color:  Color(0xFFE3D081),
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Row(
              
              children: [
              
              Text(
                singleton.printName(),
                style: const TextStyle(fontSize: 30.00, color: Color.fromARGB(255, 5, 5, 5), fontStyle: FontStyle.italic),
            
              ),
              Spacer(),
              ElevatedButton(onPressed: onPressed, child: Text("Create Note"))
            ],
            ),
          ), 
          SizedBox(// Make this generate for each item of the remaining page. Also look at how to define page colour
            child: Container(
              color:  Color.fromARGB(255, 254, 244, 207),
              child: Row( // Row for notes content, try generative feature based on each article in notes
                
                children: [
                
                Text(
                  singleton.printName(),
                  style: TextStyle(fontSize: 30.00, color: Color.fromARGB(25, 30, 24, 23)),
              
                ),
                Spacer(),
                ElevatedButton(onPressed: onPressed, child: Text("Create Note")),
                Spacer(),
                ElevatedButton(onPressed: onPressed, child: Text("Create Note"))
              ],
              ),
            ),
          ),

        ],

      ),
      
    );
  }

  void onPressed() {
  }
}
