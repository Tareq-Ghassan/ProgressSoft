import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A [PhoneNumberCubit] which manages `phone number` as its state
class PhoneNumberCubit extends Cubit<String> {
  /// The initial state of the [PhoneNumberCubit] is `''`.
  PhoneNumberCubit() : super('');

  /// [setPhone] function to set a new value for phone
  void setPhone({required String newVal}) {
    emit(newVal);
  }

  @override
  void onChange(Change<String> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}

/// A [PasswordCubit] which manages `password` as its state
class PasswordCubit extends Cubit<String> {
  /// The initial state of the [PasswordCubit] is `''`.
  PasswordCubit() : super('');

  /// [setPassword] function to set a new value for password
  void setPassword({required String newVal}) {
    emit(newVal);
  }

  @override
  void onChange(Change<String> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}
