import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/app_constance.dart';
import 'package:to_do_app/core/utils/enums.dart';
import 'package:to_do_app/home/domain/usecases/add_to_do_usecase.dart';
import 'package:to_do_app/home/domain/usecases/get_to_do_usecase.dart';
import 'package:to_do_app/home/domain/usecases/update_to_do_usecase.dart';

part 'bottom_sheet_event.dart';
part 'bottom_sheet_state.dart';

class BottomSheetBloc extends Bloc<BottomSheetEvent, BottomSheetState> {
  AddToDoUseCase addToDoUseCase;
  UpdateToDoUseCase updateToDoUseCase;
  GetToDoUseCase getToDoUseCase;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  BottomSheetBloc(
    this.addToDoUseCase,
    this.updateToDoUseCase,
    this.getToDoUseCase,
  ) : super(const BottomSheetState()) {
    on<ChangeDateNoteEvent>(_changeDateNoteEvent);

    on<AddImageEvent>(_addImageEvent);

    on<AddToDoEvent>(_addToDoEvent);

    on<EditToDoEvent>(_editToDoEvent);

    on<UpdateToDoEvent>((event, emit) async {
      emit(state.copyWith(saveState: ButtonRequestState.loading));

      String dateNote = state.dateNote == null
          ? ''
          : AppConstance.formatDate(state.dateNote!);

      final result = await updateToDoUseCase(UpdateToDoParameters(
        noteID: event.noteID,
        title: titleController.text,
        subTitle: descController.text,
        dateDeadlineNote: dateNote,
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

  FutureOr<void> _editToDoEvent(event, emit) async {
    if (event.noteID != 0) {
      final result = await getToDoUseCase(GetToDoParameters(event.noteID));

      result.fold((l) {}, (r) {
        titleController.text = r.title;
        descController.text = r.subTitle;
        emit(state.copyWith(
          dateNote: r.dateDeadlineNote != ''
              ? AppConstance.toDate(r.dateDeadlineNote)
              : null,
          image: r.imageNote,
        ));
      });
    }
  }

  FutureOr<void> _addToDoEvent(event, emit) async {
    emit(state.copyWith(saveState: ButtonRequestState.loading));

    String dateNote =
        state.dateNote == null ? '' : AppConstance.formatDate(state.dateNote!);

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
  }

  FutureOr<void> _addImageEvent(event, emit) {
    File imageFile = File(event.imagePath);
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    emit(state.copyWith(image: base64Image));
  }

  FutureOr<void> _changeDateNoteEvent(event, emit) {
    emit(state.copyWith(dateNote: event.dateNote));
  }
}
