import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/usecase/base_usecase.dart';
import 'package:to_do_app/core/utils/enums.dart';
import 'package:to_do_app/home/domain/entities/to_do.dart';
import 'package:to_do_app/home/domain/usecases/get_to_do_list_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetToDoListUseCase getToDoListUseCase;
  HomeBloc(this.getToDoListUseCase) : super(const HomeState()) {
    on<ShowToDoListEvent>(_showToDoListEvent);
  }

  FutureOr<void> _showToDoListEvent(event, emit) async {
    emit(state.copyWith(getToDoListState: ButtonRequestState.loading));
    final result = await getToDoListUseCase(const NoParameters());

    result.fold((l) {
      emit(state.copyWith(
        getToDoListState: ButtonRequestState.error,
        getToDoListError: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
        toDoList: r,
        getToDoListState: ButtonRequestState.success,
      ));
    });
  }
}
