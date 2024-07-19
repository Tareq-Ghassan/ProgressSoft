import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft/bloc/posts/posts_event.dart';
import 'package:progress_soft/bloc/posts/posts_state.dart';
import 'package:progress_soft/data/repository/posts_repo.dart';

///[PostsBloc] Posts BloC
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  ///[PostsBloc] constructor
  PostsBloc(this.postsRepository) : super(PostsIsNotSearched()) {
    on<FetchPosts>((event, emit) async {
      emit(PostsIsLoading());
      try {
        final posts = await postsRepository.getPosts();
        if (posts != null) {
          debugPrint('FetchPosts event success:');
          emit(PostsIsLoaded(posts));
        } else {
          debugPrint('FetchPosts event: config is null');
          emit(PostsFailure());
        }
      } catch (error) {
        debugPrint('FetchPosts event: catch ');
        emit(PostsCatch());
        debugPrint(error.toString());
      }
    });
  }

  ///[postsRepository] holds the repo
  final PostsRepository postsRepository;
}
