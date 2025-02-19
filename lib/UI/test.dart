import 'dart:convert'; // For JSON encoding
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For clipboard functionality

class DisplayText extends StatefulWidget {
  Map<String, dynamic> temp;
  DisplayText({super.key, required this.temp});

  @override
  State<DisplayText> createState() => _DisplayTextState();
}

class _DisplayTextState extends State<DisplayText> {
  // Function to copy JSON data to clipboard
  Future<void> copyToClipboard(Map<String, dynamic> data) async {
    // Convert the map to a JSON string
    String jsonString = jsonEncode(data);

    // Copy the JSON string to clipboard
    await Clipboard.setData(ClipboardData(text: jsonString));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("JSON copied to clipboard!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display Text')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display your data
            Text(widget.temp.toString(), style: TextStyle(fontSize: 16)),
            ElevatedButton(
              onPressed: () {
                // Copy the map to clipboard when the button is pressed
                copyToClipboard(widget.temp);
              },
              child: Text("Copy to Clipboard"),
            ),
          ],
        ),
      ),
    );
  }
}
