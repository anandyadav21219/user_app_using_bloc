import 'package:blocexample/models/api_res_model.dart';
import 'package:equatable/equatable.dart';

abstract class ApiState extends Equatable {
  const ApiState();
}

class LoadingState extends ApiState {
  @override
  List<Object?> get props => [];
}

class LoadDataState extends ApiState {
  final List<Results>? resultsList;

   const LoadDataState(this.resultsList);

  @override
  List<Object?> get props => [resultsList];
}

class ErrorState extends ApiState {
  final String errorMessage;

  const ErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
