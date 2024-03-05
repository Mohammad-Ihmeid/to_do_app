import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_sheet_event.dart';
part 'bottom_sheet_state.dart';

class BottomSheetBloc extends Bloc<BottomSheetEvent, BottomSheetState> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  BottomSheetBloc() : super(const BottomSheetState()) {
    on<ChangeDateNoteEvent>((event, emit) {
      emit(state.copyWith(dateNote: event.dateNote));
    });
  }
}
