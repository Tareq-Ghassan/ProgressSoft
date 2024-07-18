import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/ui/ui_helper_bloc.dart';
import 'package:progress_soft/constants/enum/gender.dart';
import 'package:progress_soft/presentation/constants/colors.dart';
import 'package:progress_soft/presentation/constants/icons.dart';
import 'package:progress_soft/presentation/constants/size.dart';
import 'package:progress_soft/presentation/screens/otp.dart';

import 'package:progress_soft/presentation/widgets/common/confirm_button.dart';

final _firebase = FirebaseAuth.instance;

/// [RegisterScreen] this represnt Registeration screen
class RegisterScreen extends StatefulWidget {
  /// [RegisterScreen] Construtor
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

  static const _space = SizedBox(
    height: 16,
    width: 16,
  );
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _fullName = '';
  String _phone = '';
  String _password = '';
  String _cPassword = '';

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => HidePasswordCubit(),
      child: BlocBuilder<HidePasswordCubit, bool>(
        builder: (context, hidePassword) {
          return Scaffold(
            appBar: AppBar(
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(pt16),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              autocorrect: false,
                              autofillHints: const [
                                AutofillHints.telephoneNumberDevice,
                              ],
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: pt16),
                                // prefixIconColor: Colors.black,
                                filled: true,
                                fillColor: Colors.transparent,

                                hintText: appLocalizations.fullName,
                              ),
                              onChanged: (value) {
                                _fullName = value;
                              },
                              onSaved: (newValue) {
                                if (newValue != null) {
                                  _fullName = newValue;
                                }
                              },
                              textInputAction: TextInputAction.next,
                            ),
                            RegisterScreen._space,
                            TextFormField(
                              autocorrect: false,
                              autofillHints: const [
                                AutofillHints.telephoneNumberDevice,
                              ],
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: pt16),
                                // prefixIconColor: Colors.black,
                                filled: true,
                                fillColor: Colors.transparent,

                                hintText: appLocalizations.phoneNumber,
                              ),
                              // validator: (value) => validateInputUser(context, value),
                              onChanged: (value) {
                                _phone = value;
                              },
                              onSaved: (newValue) {
                                if (newValue != null) {
                                  _phone = newValue;
                                }
                              },
                              textInputAction: TextInputAction.next,
                            ),
                            RegisterScreen._space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
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
                                          scrollController:
                                              FixedExtentScrollController(
                                            initialItem: _selectedAge,
                                          ),
                                          onSelectedItemChanged:
                                              (int selectedItem) {
                                            setState(() {
                                              _selectedAge = selectedItem;
                                            });
                                          },
                                          children: List<Widget>.generate(
                                              agesList.length, (int index) {
                                            return Center(
                                              child: Text(agesList[index]),
                                            );
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
                                ),
                                RegisterScreen._space,
                                DropdownMenu<String>(
                                  initialSelection: gender.first,
                                  onSelected: (String? value) {
                                    setState(() {
                                      dropdownValue = value!;
                                    });
                                  },
                                  dropdownMenuEntries: gender
                                      .map<DropdownMenuEntry<String>>(
                                          (String value) {
                                    return DropdownMenuEntry<String>(
                                      value: value,
                                      label: value,
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                            RegisterScreen._space,
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: hidePassword,
                              decoration: InputDecoration(
                                suffixIcon: hidePassword
                                    ? InkWell(
                                        onTap: () {
                                          final cubit =
                                              context.read<HidePasswordCubit>();
                                          final hidePasswordState = cubit.state;
                                          cubit.setHidePassword(
                                            newVal: !hidePasswordState,
                                          );
                                        },
                                        child: const Icon(
                                          Icons.visibility_off_outlined,
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          final cubit =
                                              context.read<HidePasswordCubit>();
                                          final hidePasswordState = cubit.state;
                                          cubit.setHidePassword(
                                            newVal: !hidePasswordState,
                                          );
                                        },
                                        child: const Icon(
                                          Icons.visibility_outlined,
                                        ),
                                      ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: pt16),
                                filled: true,
                                fillColor: Colors.transparent,
                                prefixIcon: Image.asset(
                                  AppIcons.of(context).lock,
                                  color: royalBlueColor,
                                ),
                                hintText: appLocalizations.password,
                              ),
                              onChanged: (value) {
                                _password = value;
                              },
                              // validator: (value) => validateInputPassword(context, value),
                              onSaved: (newValue) {
                                if (newValue != null) {
                                  _password = newValue;
                                }
                              },
                              textInputAction: TextInputAction.done,
                            ),
                            RegisterScreen._space,
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: hidePassword,
                              decoration: InputDecoration(
                                suffixIcon: hidePassword
                                    ? InkWell(
                                        onTap: () {
                                          final cubit =
                                              context.read<HidePasswordCubit>();
                                          final hidePasswordState = cubit.state;
                                          cubit.setHidePassword(
                                            newVal: !hidePasswordState,
                                          );
                                        },
                                        child: const Icon(
                                          Icons.visibility_off_outlined,
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          final cubit =
                                              context.read<HidePasswordCubit>();
                                          final hidePasswordState = cubit.state;
                                          cubit.setHidePassword(
                                            newVal: !hidePasswordState,
                                          );
                                        },
                                        child: const Icon(
                                          Icons.visibility_outlined,
                                        ),
                                      ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: pt16),
                                filled: true,
                                fillColor: Colors.transparent,
                                prefixIcon: Image.asset(
                                  AppIcons.of(context).lock,
                                  color: royalBlueColor,
                                ),
                                hintText: appLocalizations.password,
                              ),
                              onChanged: (value) {
                                _cPassword = value;
                              },
                              // validator: (value) => validateInputPassword(context, value),
                              onSaved: (newValue) {
                                if (newValue != null) {
                                  _cPassword = newValue;
                                }
                              },
                              textInputAction: TextInputAction.done,
                            ),
                            RegisterScreen._space,
                          ],
                        ),
                      ),
                    ),
                    ConfrimButton(
                      title: appLocalizations.signUp,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (context) => OTPScreen(
                              phone: _phone,
                            ),
                          ),
                        );

                        // final userCredential =
                        //     await _firebase.createUserWithEmailAndPassword(
                        //   email: '$_phone@domain.com',
                        //   password: _cPassword,
                        // );

                        // final userId = userCredential.user!.uid;
                        // await FirebaseFirestore.instance
                        //     .collection('profile')
                        //     .doc(userId) // Use userId as the document ID
                        //     .set({
                        //   'name': _fullName,
                        //   'phone': _phone,
                        //   'age': _selectedAge,
                        //   'gender': dropdownValue,
                        // }).then((_) {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute<dynamic>(
                        //       builder: (context) => const OTPScreen(),
                        //     ),
                        //   );
                        // });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  int _selectedAge = 0;
  String dropdownValue = gender.first;
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
}

/// [agesList] a list of ages from 12-100
List<String> agesList = List.generate(89, (index) => (12 + index).toString());

/// [gender] a list of Genders
List<String> gender = <String>[Gender.male.name, Gender.female.name];
