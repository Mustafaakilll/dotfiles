import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/storage_repository.dart';
import '../../user_repository.dart';
import '../model/user_model.dart';

part './profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._userRepo, this._storageRepo) : super(const ProfileState.fetching()) {
    on<ProfileEvent>(((event, emit) {
      event.when(
        fetch: () => _onFetchUser(emit),
        followUser: (username) => _onFollowUser(username, emit),
        unfollowUser: (username) => _onUnfollowUser(username),
      );
    }));
    // on<_Fetch>((event, emit) => _onFetchUser());
    // on<_FollowUser>((event, emit) => _onFollowUser(event.username));
    // on<_UnfollowUser>((event, emit) => _onUnfollowUser(event.username));
  }

  final UserRepository _userRepo;
  final StorageRepository _storageRepo;

  Future<void> _onFetchUser(Emitter<ProfileState> emit) async {
    emit(const ProfileState.fetching());
    try {
      final userInfo = await _storageRepo.getData<Map<dynamic, dynamic>>('user');
      final user = await _userRepo.getUserByUsername(userInfo);
      emit(ProfileState.fetchSuccess(user: user));
    } catch (e) {
      emit(ProfileState.fetchFail(exception: e.toString()));
    }
  }

  Future<void> _onFollowUser(String username, Emitter<ProfileState> emit) async {
    try {
      final user = await _userRepo.followUser(username);
      emit(ProfileState.followSuccess(user: user));
    } catch (e) {
      emit(ProfileState.followFail(exception: e.toString()));
    }
  }

  Future<void> _onUnfollowUser(String username) async {
    try {
      final user = await _userRepo.unfollowUser(username);
      emit(ProfileState.followSuccess(user: user));
    } catch (e) {
      emit(ProfileState.followFail(exception: e.toString()));
    }
  }
}
