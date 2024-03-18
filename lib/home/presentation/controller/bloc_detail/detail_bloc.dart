import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/utils/enums.dart';
import 'package:to_do_app/home/domain/usecases/delete_to_do_usecase.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DeleteToDoUseCase deleteToDoUseCase;
  DetailBloc(this.deleteToDoUseCase) : super(const DetailState()) {
    on<DeleteNoteEven>(_deleteNoteEven);
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
