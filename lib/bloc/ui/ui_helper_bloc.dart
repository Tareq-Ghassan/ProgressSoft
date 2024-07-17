import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A [HidePasswordCubit] which manages `HidePassword` as its state
class HidePasswordCubit extends Cubit<bool> {
  /// The initial state of the [HidePasswordCubit] is `true`.
  HidePasswordCubit() : super(true);

  /// [setHidePassword] function to set a new HidePassword value
  void setHidePassword({required bool newVal}) {
    emit(newVal);
  }

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}
