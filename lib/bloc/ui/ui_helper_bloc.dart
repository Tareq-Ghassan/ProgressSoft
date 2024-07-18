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

/// A [ShimmerCubit] which manages `shimmer loading` as its state
class ShimmerCubit extends Cubit<bool> {
  /// The initial state of the [ShimmerCubit] is `true`.
  ShimmerCubit() : super(true);

  /// [setShimmer] function to set a new HidePassword value
  void setShimmer({required bool newVal}) {
    emit(newVal);
  }

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}
