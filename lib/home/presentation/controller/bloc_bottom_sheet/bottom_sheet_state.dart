part of 'bottom_sheet_bloc.dart';

class BottomSheetState extends Equatable {
  final DateTime? dateNote;
  final String image;
  ////////////////////////////
  final ButtonRequestState saveState;
  final String saveError;

  const BottomSheetState({
    this.dateNote,
    this.image = '',
    ////////////////////////////
    this.saveState = ButtonRequestState.normal,
    this.saveError = '',
  });

  BottomSheetState copyWith({
    DateTime? dateNote,
    String? image,
    ////////////////////////////
    ButtonRequestState? saveState,
    String? saveError,
  }) {
    return BottomSheetState(
      dateNote: dateNote ?? this.dateNote,
      image: image ?? this.image,
      ////////////////////////////
      saveState: saveState ?? this.saveState,
      saveError: saveError ?? this.saveError,
    );
  }

  @override
  List<Object?> get props => [
        dateNote,
        image,
        ////////////////////////////
        saveState,
        saveError,
      ];
}
