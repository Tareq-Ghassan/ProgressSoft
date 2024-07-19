import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft/bloc/ui/ui_helper_bloc.dart';
import 'package:progress_soft/presentation/constants/colors.dart';

/// [HomeBottomNavigation] represent bottom navigation for app
class HomeBottomNavigation extends StatelessWidget {
  ///[HomeBottomNavigation] constructor
  const HomeBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: whiteColor,
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
      currentIndex: context.read<HomeIndexCubit>().state,
      onTap: (int index) async {
        context.read<HomeIndexCubit>().setIndex(newVal: index);
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
    );
  }
}
