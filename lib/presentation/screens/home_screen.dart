import 'package:flutter/material.dart';
import 'package:progress_soft/presentation/constants/colors.dart';
import 'package:progress_soft/presentation/widgets/common/appbar.dart';

/// [HomeScreen] represent home page screen
class HomeScreen extends StatefulWidget {
  /// [HomeScreen] constructor
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndext = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarLinearGradient(title: 'Home'),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedFontSize: Theme.of(context).textTheme.titleSmall!.fontSize!,
        unselectedFontSize: Theme.of(context).textTheme.titleSmall!.fontSize!,
        selectedLabelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w400,
              color: ligthGrayColor,
            ),
        unselectedLabelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w400,
              color: ligthGrayColor,
            ),
        fixedColor: Colors.grey[600],
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        currentIndex: currentIndext,
        onTap: (int index) {},
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
