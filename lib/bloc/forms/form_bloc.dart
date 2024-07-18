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

/// A [ConfirmPasswordCubit] which manages `confirm password` as its state
class ConfirmPasswordCubit extends Cubit<String> {
  /// The initial state of the [ConfirmPasswordCubit] is `''`.
  ConfirmPasswordCubit() : super('');

  /// [setConfirmPassword] function to set a new value for confirm password
  void setConfirmPassword({required String newVal}) {
    emit(newVal);
  }

  @override
  void onChange(Change<String> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}

/// A [FullNameCubit] which manages `full name` as its state
class FullNameCubit extends Cubit<String> {
  /// The initial state of the [FullNameCubit] is `''`.
  FullNameCubit() : super('');

  /// [setFullName] function to set a new value for full name
  void setFullName({required String newVal}) {
    emit(newVal);
  }

  @override
  void onChange(Change<String> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}

/// A [CountryCodeCubit] which manages `country code` as its state
class CountryCodeCubit extends Cubit<String> {
  /// The initial state of the [CountryCodeCubit] is `962`.
  CountryCodeCubit() : super('962');

  /// [setCountryCode] function to set a new value for country code
  void setCountryCode({required String newVal}) {
    emit(newVal);
  }

  @override
  void onChange(Change<String> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}

/// A [AgeCubit] which manages `age` as its state
class AgeCubit extends Cubit<int> {
  /// The initial state of the [CountryCodeCubit] is `0`.
  AgeCubit() : super(0);

  /// [setAge] function to set a new value for age
  void setAge({required int newVal}) {
    emit(newVal);
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}

/// A [GenderCubit] which manages `age` as its state
class GenderCubit extends Cubit<String> {
  /// The initial state of the [GenderCubit] is `0`.
  GenderCubit() : super('Male');

  /// [setAge] function to set a new value for age
  void setAge({required String newVal}) {
    emit(newVal);
  }

  @override
  void onChange(Change<String> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}
