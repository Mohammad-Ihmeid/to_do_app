part of 'bottom_sheet_bloc.dart';

class BottomSheetState extends Equatable {
  final DateTime? dateNote;
  const BottomSheetState({
    this.dateNote,
  });

  BottomSheetState copyWith({
    DateTime? dateNote,
  }) {
    return BottomSheetState(dateNote: dateNote ?? this.dateNote);
  }

  @override
  List<Object?> get props => [dateNote];
}
