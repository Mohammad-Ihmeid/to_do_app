part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<ToDo> toDoList;
  final ButtonRequestState getToDoListState;
  final String getToDoListError;

  const HomeState({
    this.toDoList = const [],
    this.getToDoListState = ButtonRequestState.normal,
    this.getToDoListError = '',
  });

  HomeState copyWith({
    List<ToDo>? toDoList,
    ButtonRequestState? getToDoListState,
    String? getToDoListError,
  }) {
    return HomeState(
      toDoList: toDoList ?? this.toDoList,
      getToDoListState: getToDoListState ?? this.getToDoListState,
      getToDoListError: getToDoListError ?? this.getToDoListError,
    );
  }

  @override
  List<Object> get props => [
        toDoList,
        getToDoListState,
        getToDoListError,
      ];
}
