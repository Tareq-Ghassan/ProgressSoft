import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:progress_soft/data/model/posts.dart';

///[PostsState] `immutable` class created to hold state
@immutable
abstract class PostsState extends Equatable {
  /// [PostsState] constructor
  const PostsState();
  @override
  List<List<Posts>> get props => [];
}

/// [PostsIsNotSearched] state
class PostsIsNotSearched extends PostsState {}

/// [PostsIsLoading] state
class PostsIsLoading extends PostsState {}

/// [PostsIsLoaded] state
class PostsIsLoaded extends PostsState {
  /// [PostsIsLoaded] constructor
  const PostsIsLoaded(
    this._appPosts,
  );
  final List<Posts> _appPosts;

  /// [getPosts] getter
  List<Posts> get getPosts => _appPosts;
  @override
  List<List<Posts>> get props => [_appPosts];
}

/// [PostsFailure] state
class PostsFailure extends PostsState {}

/// [PostsCatch] state
class PostsCatch extends PostsState {}
