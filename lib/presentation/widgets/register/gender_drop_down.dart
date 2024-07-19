import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/enum/gender.dart';

/// [GenderDropDown] reperesent gender picker
class GenderDropDown extends StatelessWidget {
  /// [GenderDropDown] constructor
  const GenderDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: gender.first,
      onSelected: (String? value) {
        context.read<GenderCubit>().setGender(newVal: value ?? '');
      },
      dropdownMenuEntries:
          gender.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
        );
      }).toList(),
    );
  }
}
