part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class ShowToDoListEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}
