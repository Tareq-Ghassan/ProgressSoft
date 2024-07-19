import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/posts/posts_bloc.dart';
import 'package:progress_soft/bloc/posts/posts_event.dart';
import 'package:progress_soft/bloc/posts/posts_state.dart';
import 'package:progress_soft/presentation/animation/listtile_shimmer_animation.dart';
import 'package:progress_soft/presentation/constants/colors.dart';
import 'package:progress_soft/presentation/constants/size.dart';
import 'package:progress_soft/presentation/widgets/home/posts_listtile.dart';

/// [HomePage] this represent the Home page
class HomePage extends StatelessWidget {
  ///[HomePage] constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) => Column(
        children: [
          Padding(
            padding: EdgeInsets.all(pt16),
            child: TextField(
              onChanged: (value) =>
                  BlocProvider.of<PostsBloc>(context).add(SearchPosts(value)),
              decoration: InputDecoration(
                labelText: appLocalizations.search,
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                if (state is PostsIsLoading) {
                  return const ListTileShimmer(
                    isLoading: true,
                  );
                } else if (state is PostsIsLoaded &&
                    state.getPosts.isNotEmpty) {
                  return PostsListTile(post: state.getPosts[index]);
                } else {
                  return const ListTileShimmer(
                    isLoading: true,
                  );
                }
              },
              itemCount: state is PostsIsLoading
                  ? 10
                  : (state is PostsIsLoaded ? state.getPosts.length : 0),
              separatorBuilder: (context, index) => Divider(
                thickness: 10,
                color: blackColor.withOpacity(0.05),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
