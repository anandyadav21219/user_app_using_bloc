import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocexample/bloc/api_event.dart';
import 'package:blocexample/bloc/api_repository.dart';
import 'package:blocexample/bloc/api_state.dart';
import 'package:blocexample/models/api_res_model.dart';
import 'package:equatable/equatable.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final ApiRepository apiRepository;
  ApiBloc(this.apiRepository) : super(LoadingState()) {
    on<ApiEvent>((event, emit) async {
      emit(LoadingState());
      List<Results>? resultList;
      try {
        ApiResModel apiResModel = await apiRepository.getAllData();
        emit(LoadDataState(apiResModel.results));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }
}
