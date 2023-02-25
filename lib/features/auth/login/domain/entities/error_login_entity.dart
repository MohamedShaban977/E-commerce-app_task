import 'package:equatable/equatable.dart';

class ErrorLoginEntity extends Equatable {
  const ErrorLoginEntity({
    required this.detail,
  });

  final String detail;

  @override
  List<Object?> get props =>[detail];


}
