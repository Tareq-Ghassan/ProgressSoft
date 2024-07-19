import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_soft/presentation/constants/colors.dart';
import 'package:progress_soft/presentation/constants/icons.dart';

/// [ProfilePage] represent Profile page
class ProfilePage extends StatelessWidget {
  /// [ProfilePage] Constructor
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = AppIcons.of(context);

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        radius: 40,
        backgroundColor: yellowColor,
        child: Text('T A'),
      ),
      title: const Text('TAREQ ABUSALEH'),
      subtitle: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('PHONE: 0962797130097'),
          Text('GENDER: MALE'),
          Text('Age: 6'),
        ],
      ),
      trailing: TextButton.icon(
        onPressed: () {
          FirebaseAuth.instance.signOut();
        },
        icon: Image.asset(icons.logoutIcon),
        label: const Text('Logout'),
      ),
    );
  }
}
