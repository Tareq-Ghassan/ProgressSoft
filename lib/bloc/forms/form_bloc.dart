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

  /// [setGender] function to set a new value for age
  void setGender({required String newVal}) {
    emit(newVal);
  }

  @override
  void onChange(Change<String> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}

/// A [OTPCubit] which manages `otp` as its state
class OTPCubit extends Cubit<String> {
  /// The initial state of the [OTPCubit] is `''`.
  OTPCubit() : super('');

  /// [setOTP] function to set a new value for otp
  void setOTP({required String newVal}) {
    emit(newVal);
  }

  @override
  void onChange(Change<String> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}

/// A [VerifiactionIDCubit] which manages `verification id otp` as its state
class VerifiactionIDCubit extends Cubit<String> {
  /// The initial state of the [VerifiactionIDCubit] is `''`.
  VerifiactionIDCubit() : super('');

  /// [setVerificationID] function to set a new value for otp
  void setVerificationID({required String newVal}) {
    emit(newVal);
  }

  @override
  void onChange(Change<String> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}

/// A [MinimumSixCharsValidCubit] which manages `min 6 char` as its state
class MinimumSixCharsValidCubit extends Cubit<bool> {
  /// The initial state of the [MinimumSixCharsValidCubit] is `false`.
  MinimumSixCharsValidCubit() : super(false);

  /// [setMinimumSixCharsValid] function to set a new value for `min 6 char
  void setMinimumSixCharsValid({required bool newVal}) {
    emit(newVal);
  }

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}

/// A [MinimumOneDigitValidCubit] which manages `min one digit` as its state
class MinimumOneDigitValidCubit extends Cubit<bool> {
  /// The initial state of the [MinimumOneDigitValidCubit] is `false`.
  MinimumOneDigitValidCubit() : super(false);

  /// [setMinimumOneDigitValidCubit] function to set a new value
  /// for min one digit
  void setMinimumOneDigitValidCubit({required bool newVal}) {
    emit(newVal);
  }

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}

/// A [MinimumOneLowerValidCubit] which manages `min lower case` as its state
class MinimumOneLowerValidCubit extends Cubit<bool> {
  /// The initial state of the [MinimumOneLowerValidCubit] is `false`.
  MinimumOneLowerValidCubit() : super(false);

  /// [setMinimumOneLowerValidCubit] function to set a new value
  /// for min lower case
  void setMinimumOneLowerValidCubit({required bool newVal}) {
    emit(newVal);
  }

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}

/// A [MinimumOneUpperValidCubit] which manages `min upper case` as its state
class MinimumOneUpperValidCubit extends Cubit<bool> {
  /// The initial state of the [MinimumOneUpperValidCubit] is `false`.
  MinimumOneUpperValidCubit() : super(false);

  /// [setMinimumOneUpperValidCubit] function to set a new value for
  /// min upper case
  void setMinimumOneUpperValidCubit({required bool newVal}) {
    emit(newVal);
  }

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}

/// A [MinimumOneSpecialCharValidCubit] which manages
/// `min special char` as its state
class MinimumOneSpecialCharValidCubit extends Cubit<bool> {
  /// The initial state of the [MinimumOneSpecialCharValidCubit] is `false`.
  MinimumOneSpecialCharValidCubit() : super(false);

  /// [setMinimumOneSpecialCharValid] function to set a new value for
  /// min special char
  void setMinimumOneSpecialCharValid({required bool newVal}) {
    emit(newVal);
  }

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}
