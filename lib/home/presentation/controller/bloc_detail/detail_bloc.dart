import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/utils/enums.dart';
import 'package:to_do_app/home/domain/entities/to_do.dart';
import 'package:to_do_app/home/domain/usecases/delete_to_do_usecase.dart';
import 'package:to_do_app/home/domain/usecases/get_to_do_usecase.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DeleteToDoUseCase deleteToDoUseCase;
  GetToDoUseCase getToDoUseCase;
  DetailBloc(
    this.deleteToDoUseCase,
    this.getToDoUseCase,
  ) : super(const DetailState()) {
    on<DeleteNoteEven>(_deleteNoteEven);

    on<GetDataNoteEvent>(_getDataNoteEvent);
  }

  FutureOr<void> _getDataNoteEvent(event, emit) async {
    emit(state.copyWith(requestNoteState: ButtonRequestState.loading));

    final result = await getToDoUseCase(GetToDoParameters(event.noteID));

    result.fold((l) {
      emit(state.copyWith(
        requestNoteState: ButtonRequestState.error,
        requestNoteError: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
        requestNoteState: ButtonRequestState.success,
        toDoNote: r,
      ));
    });
  }

  FutureOr<void> _deleteNoteEven(event, emit) async {
    emit(state.copyWith(deleteNoteState: ButtonRequestState.loading));
    final result = await deleteToDoUseCase(DeleteToDoParameters(event.noteID));

    result.fold((l) {
      emit(state.copyWith(
        deleteNoteState: ButtonRequestState.error,
        deleteNoteError: l.message,
      ));
    }, (r) {
      emit(state.copyWith(deleteNoteState: ButtonRequestState.success));
    });
  }
}
