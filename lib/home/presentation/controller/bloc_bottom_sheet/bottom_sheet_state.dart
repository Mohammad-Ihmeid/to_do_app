part of 'bottom_sheet_bloc.dart';

class BottomSheetState extends Equatable {
  final DateTime? dateNote;
  final String image;
  const BottomSheetState({
    this.dateNote,
    this.image = '',
  });

  BottomSheetState copyWith({
    DateTime? dateNote,
    String? image,
  }) {
    return BottomSheetState(
      dateNote: dateNote ?? this.dateNote,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [dateNote, image];
}
