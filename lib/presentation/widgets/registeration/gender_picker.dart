import 'package:flutter/material.dart';
import 'package:progress_soft/constants/enum/gender.dart';

/// [gender] a list of Genders
List<String> gender = <String>[Gender.male.name, Gender.female.name];

///[GenderPicker] represent gender picker widget
class GenderPicker extends StatefulWidget {
  /// [GenderPicker] constructor
  const GenderPicker({super.key});

  @override
  State<GenderPicker> createState() => _GenderPickerState();
}

class _GenderPickerState extends State<GenderPicker> {
  String dropdownValue = gender.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: gender.first,
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries:
          gender.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
