import 'package:equatable/equatable.dart';

class MasalahEntity extends Equatable {
  final int masalahId;
  final String masalahTitle;
  final String masalahDescription;
  final String masalahRefrence;
  final int categoryId;

  MasalahEntity(
      {required this.masalahId,
      required this.masalahTitle,
      required this.masalahDescription,
      required this.masalahRefrence,
      required this.categoryId});

  @override
  List<Object> get props => [masalahId, masalahTitle];

  @override
  bool get stringify => true;
}
