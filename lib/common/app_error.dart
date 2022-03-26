import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  //1
  final String message;

  const AppError(this.message);

  //2
  @override
  List<Object> get props => [message];
}
