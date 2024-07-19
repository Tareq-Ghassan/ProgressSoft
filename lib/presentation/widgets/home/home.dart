import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft/bloc/posts/posts_bloc.dart';
import 'package:progress_soft/bloc/posts/posts_state.dart';
import 'package:progress_soft/presentation/animation/listtile_shimmer_animation.dart';
import 'package:progress_soft/presentation/constants/colors.dart';
import 'package:progress_soft/presentation/widgets/home/posts_listtile.dart';

/// [HomePage] this represent the Home page
class HomePage extends StatelessWidget {
  ///[HomePage] constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) => ListView.separated(
        itemBuilder: (context, index) => state is PostsIsLoading?
            ? ListTileShimmer(
                isLoading: state is PostsIsLoading,
              )
            : state.props.isEmpty
                ? const ListTileShimmer(
                    isLoading: true,
                  )
                : PostsListTile(
                    post: state.props.first[index],
                  ),
        itemCount: state is PostsIsLoading
            ? 10
            : state.props.isNotEmpty
                ? state.props.first.length
                : 10,
        separatorBuilder: (context, index) => Divider(
          thickness: 10,
          color: blackColor.withOpacity(0.05),
        ),
      ),
    );
  }
}
