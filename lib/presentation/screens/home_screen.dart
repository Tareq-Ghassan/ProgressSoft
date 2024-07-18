import 'package:flutter/material.dart';
import 'package:progress_soft/data/repository/posts_repo.dart';

import 'package:progress_soft/presentation/constants/colors.dart';
import 'package:progress_soft/presentation/widgets/common/appbar.dart';
import 'package:progress_soft/presentation/widgets/home/home.dart';
import 'package:progress_soft/presentation/widgets/home/profile.dart';

/// [HomeScreen] represent home page screen
class HomeScreen extends StatefulWidget {
  /// [HomeScreen] constructor
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await PostsRepository.getPosts();
    });
  }

  final activeTabs = [
    const HomePage(),
    const ProfilePage(),
  ];
  int currentIndext = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarLinearGradient(title: 'Home'),
      body: activeTabs[currentIndext],
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
        onTap: (int index) async {
          await PostsRepository.getPosts();
          currentIndext = index;
          setState(() {});
        },
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
