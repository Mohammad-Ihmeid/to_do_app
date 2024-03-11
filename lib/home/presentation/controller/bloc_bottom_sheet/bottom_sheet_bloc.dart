import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/app_constance.dart';
import 'package:to_do_app/core/utils/enums.dart';
import 'package:to_do_app/home/domain/usecases/add_to_do_usecase.dart';

part 'bottom_sheet_event.dart';
part 'bottom_sheet_state.dart';

class BottomSheetBloc extends Bloc<BottomSheetEvent, BottomSheetState> {
  AddToDoUseCase addToDoUseCase;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  BottomSheetBloc(this.addToDoUseCase) : super(const BottomSheetState()) {
    on<ChangeDateNoteEvent>((event, emit) {
      emit(state.copyWith(dateNote: event.dateNote));
    });

    on<AddImageEvent>((event, emit) {
      File imageFile = File(event.imagePath);
      List<int> imageBytes = imageFile.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      emit(state.copyWith(image: base64Image));
    });

    on<AddToDoEvent>((event, emit) async {
      emit(state.copyWith(saveState: ButtonRequestState.loading));

      String dateNote = state.dateNote == null
          ? ''
          : AppConstance.formatDate(state.dateNote!);

      final result = await addToDoUseCase(AddToDoParameters(
        title: titleController.text,
        subTitle: descController.text,
        dateDeadlineNote: dateNote,
        dateCreatedNote: AppConstance.formatDate(DateTime.now()),
        imageNote: state.image,
      ));

      result.fold((l) {
        emit(state.copyWith(
          saveState: ButtonRequestState.error,
          saveError: l.message,
        ));
      }, (r) {
        titleController.clear();
        descController.clear();
        emit(state.copyWith(
          dateNote: DateTime.now(),
          image: '',
          saveState: ButtonRequestState.success,
        ));
      });
    });
  }
}
