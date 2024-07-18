import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/presentation/controller/otp_view_controller.dart';
import 'package:progress_soft/presentation/widgets/common/confirm_button.dart';
import 'package:progress_soft/presentation/widgets/otp/otp_header.dart';
import 'package:progress_soft/presentation/widgets/otp/otp_txfield.dart';

/// [OTPScreen] represent OTP screen
class OTPScreen extends StatefulWidget {
  /// [OTPScreen] consturctor.
  const OTPScreen({
    super.key,
  });

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  void initState() {
    listenSms();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await sendOTP();
    });
    super.initState();
  }

  @override
  void dispose() {
    closeSms();

    debugPrint('Unregistered Listener');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: PopScope(
        onPopInvoked: (didPop) {
          context.read<OTPCubit>().setOTP(newVal: '');
        },
        child: Scaffold(
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
          backgroundColor: Colors.white,
          body: const SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      OTPHeader(),
                      OTPTextField(),
                      SizedBox(height: 270),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: ConfrimButton(
            title: appLocalizations.confirm,
            onPressed: context.read<OTPCubit>().state.length == 6
                ? () => verifyOTP(
                      context.read<OTPCubit>().state,
                    )
                : null,
          ),
        ),
      ),
    );
  }
}
