import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/presentation/constants/size.dart';
import 'package:progress_soft/presentation/controller/registeration_view_controller.dart';

/// [agesList] a list of ages from 12-100
List<String> agesList = List.generate(89, (index) => (12 + index).toString());

/// [AgePicker] represent age picker
class AgePicker extends StatelessWidget {
  /// [AgePicker] constructor
  const AgePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(appLocalizations.selectAge),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => showAgePickerDialog(
            CupertinoPicker(
              magnification: 1.22,
              squeeze: 1.2,
              useMagnifier: true,
              itemExtent: pt30,
              scrollController: FixedExtentScrollController(
                initialItem: context.read<AgeCubit>().state,
              ),
              onSelectedItemChanged: (int selectedItem) {
                context.read<AgeCubit>().setAge(newVal: selectedItem);
              },
              children: List<Widget>.generate(agesList.length, (int index) {
                return Center(
                  child: Text(agesList[index]),
                );
              }),
            ),
          ),
          child: Text(
            agesList[context.read<AgeCubit>().state],
            style: TextStyle(
              fontSize: pt24,
            ),
          ),
        ),
      ],
    );
  }
}
