import 'package:equatable/equatable.dart';

class ProductsEntity extends Equatable {
  final int id;
  final String name;
  final String imageLink;
  final String price;
  final String description;
  final String rate;
  final CategoryEntity? category;

  const ProductsEntity(
      {required this.id,
      required this.name,
      required this.imageLink,
      required this.price,
      required this.description,
      required this.rate,
      required this.category});

  @override
  List<Object?> get props =>
      [id, name, imageLink, price, description, rate, category];
}

class CategoryEntity extends Equatable {
  final int id;
  final String name;
  final String imageLink;

  const CategoryEntity(
      {required this.id, required this.name, required this.imageLink});

  @override
  List<Object?> get props => [id, name, imageLink];
}
