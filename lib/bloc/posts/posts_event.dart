import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// [PostsEvent] `immutable` class created to hold events
@immutable
abstract class PostsEvent extends Equatable {
  /// [PostsEvent] constructor
  const PostsEvent();
  @override
  List<Object> get props => [];
}

///[FetchPosts] fetch event
class FetchPosts extends PostsEvent {
  ///[FetchPosts] constructor
  const FetchPosts();

  ///[props]
  @override
  List<Object> get props => super.props;
}

///[ResetPosts] reset event
class ResetPosts extends PostsEvent {
  ///[ResetPosts] constructor
  const ResetPosts();

  ///[props]
  @override
  List<Object> get props => super.props;
}

/// [SearchPosts] search event
class SearchPosts extends PostsEvent {
  /// [SearchPosts] constructor.
  const SearchPosts(this.query);

  /// [query]
  final String query;

  @override
  List<Object> get props => [query];
}
