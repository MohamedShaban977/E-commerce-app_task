import 'package:equatable/equatable.dart';

class CategoriesEntity extends Equatable {
  final int id;

  final String name;

  final String imageLink;

  const CategoriesEntity(
      {required this.id, required this.name, required this.imageLink});

  @override
  List<Object?> get props => [id, name, imageLink];
}
