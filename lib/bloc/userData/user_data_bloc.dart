import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft/bloc/userData/user_data_state.dart';
import 'package:progress_soft/bloc/userdata/user_data_event.dart';
import 'package:progress_soft/data/repository/user_data_repo.dart';

///[UserDataBloc] UserData BloC
class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  ///[UserDataBloc] constructor
  UserDataBloc(this.userDataRepository) : super(UserDataIsNotSearched()) {
    on<FetchUserData>((event, emit) async {
      emit(UserDataIsLoading());
      try {
        final userData = await userDataRepository.fetchUserData();
        if (userData != null) {
          debugPrint('FetchUserData event success:');
          emit(UserDataIsLoaded(userData));
        } else {
          debugPrint('FetchUserData event: userData is null');
          emit(UserDataFailure());
        }
      } catch (error) {
        debugPrint('FetchUserData event: catch ');
        emit(UserDataCatch());
        debugPrint(error.toString());
      }
    });
  }

  ///[UserDataRepository] holds the repo
  final UserDataRepository userDataRepository;
}
