
import 'package:equatable/equatable.dart';

abstract class ApiEvent extends Equatable {
  const ApiEvent();
}

class LoadDataEvent extends ApiEvent {
  @override
  List<Object> get props => [];
}

