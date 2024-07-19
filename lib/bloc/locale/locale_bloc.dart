import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft/enum/locale_enum.dart';

/// A [LocaleCubit] which manages an `Locale` as its state
class LocaleCubit extends Cubit<Locale> {
  /// The initial state of the [LocaleCubit] is `en`.
  LocaleCubit() : super(Locale(Lang.english.value));

  /// [setLocale] function to set a new locale value
  void setLocale(Locale newLocale) {
    emit(newLocale);
  }

  @override
  void onChange(Change<Locale> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}
