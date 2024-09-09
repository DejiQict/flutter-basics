// show_note.dart
import 'package:flutter/material.dart';

class ShowNote extends StatelessWidget {
  final String? title;
  final String? note;
  final String? image;

  // Constructor to receive details
  const ShowNote({
    super.key,
    required this.title,
    required this.note,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Note Details'),
      ),
      body: ColoredBox(
        color: const Color.fromARGB(255, 254, 244, 207),
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                if (image != null)
                  Image.network(
                    image!,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text('Could not load image.');
                    },
                    scale: 2,
                  )
                else
                  const Text('No Image Available'),
                Text(
                  title ?? 'No Title',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  note ?? 'No Note Content',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
