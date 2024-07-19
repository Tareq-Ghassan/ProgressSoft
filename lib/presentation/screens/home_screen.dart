import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft/bloc/posts/posts_bloc.dart';
import 'package:progress_soft/bloc/posts/posts_event.dart';
import 'package:progress_soft/bloc/ui/ui_helper_bloc.dart';
import 'package:progress_soft/presentation/screens/root.dart';
import 'package:progress_soft/presentation/widgets/common/appbar.dart';
import 'package:progress_soft/presentation/widgets/home/bottom_navigation.dart';
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
      BlocProvider.of<PostsBloc>(navigatorKey.currentContext!)
          .add(const FetchPosts());
    });
  }

  final activeTabs = [
    const HomePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarLinearGradient(title: 'Home'),
      body: BlocBuilder<HomeIndexCubit, int>(
        builder: (context, state) => activeTabs[state],
      ),
      bottomNavigationBar: const HomeBottomNavigation(),
    );
  }
}
