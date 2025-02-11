import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final int seasonCount;

  Dropdown({required this.seasonCount});

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = 'Season 1';
  }

  @override
  Widget build(BuildContext context) {
    List<String> _options =
        List.generate(widget.seasonCount, (index) => 'Season ${index + 1}');

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: DropdownButton<String>(
        value: _selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            _selectedValue = newValue;
          });
        },
        items: _options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
