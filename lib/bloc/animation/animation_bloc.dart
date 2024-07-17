import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A [AnimationCubit] which manages an `animation` as its state
class AnimationCubit extends Cubit<bool> {
  /// The initial state of the [AnimationCubit] is `false`.
  AnimationCubit() : super(false);

  /// [setAnimation] function to set a new Animation value
  void setAnimation({required bool newVal}) {
    emit(newVal);
  }

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}
