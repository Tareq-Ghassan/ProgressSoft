import 'package:flutter/cupertino.dart';
import 'package:progress_soft/presentation/constants/size.dart';

/// [agesList] a list of ages from 12-100
List<String> agesList = List.generate(89, (index) => (12 + index).toString());

/// [AgePicker] represent age picker widget
class AgePicker extends StatefulWidget {
  /// [AgePicker] constructor
  const AgePicker({super.key});

  @override
  State<AgePicker> createState() => _AgePickerState();
}

class _AgePickerState extends State<AgePicker> {
  int _selectedAge = 0;

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: EdgeInsets.only(top: pt6),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Select your age: '),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => _showDialog(
            CupertinoPicker(
              magnification: 1.22,
              squeeze: 1.2,
              useMagnifier: true,
              itemExtent: pt30,
              scrollController: FixedExtentScrollController(
                initialItem: _selectedAge,
              ),
              onSelectedItemChanged: (int selectedItem) {
                setState(() {
                  _selectedAge = selectedItem;
                });
              },
              children: List<Widget>.generate(agesList.length, (int index) {
                return Center(child: Text(agesList[index]));
              }),
            ),
          ),
          child: Text(
            agesList[_selectedAge],
            style: TextStyle(
              fontSize: pt24,
            ),
          ),
        ),
      ],
    );
  }
}
