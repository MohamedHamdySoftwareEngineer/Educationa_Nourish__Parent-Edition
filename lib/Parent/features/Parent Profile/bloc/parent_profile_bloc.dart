// import 'package:bloc/bloc.dart';
import 'package:educational_nourish/Parent/core/utils/api_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/Profile.dart';
part 'parent_profile_event.dart';
part 'parent_profile_state.dart';

class ParentProfileBloc extends Bloc<ParentProfileEvent, ParentProfileState> {
  final ApiService apiService;

  ParentProfileBloc({required this.apiService}) : super(ParentProfileInitial()) {
    on<FetchParentProfile>(_onFetchParentProfile);
  }

  Future<void> _onFetchParentProfile(
      FetchParentProfile event, Emitter<ParentProfileState> emit) async {
    emit(ParentProfileLoading());
    try {
      final parentProfile =
          await apiService.fetchParentProfile(endPoint: 'parents');
      emit(ParentProfileLoaded(parentProfile));
    } catch (e) {
      emit(ParentProfileError(e is Exception ? e.toString() : 'Unexpected error'));
    }
  }
}
