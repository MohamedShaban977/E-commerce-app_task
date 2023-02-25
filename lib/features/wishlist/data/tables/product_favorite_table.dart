import 'package:hive/hive.dart';

import '../../../product_details/domain/entities/product_details_entity.dart';

part 'product_favorite_table.g.dart';

@HiveType(typeId: 0)
class ProductFavoriteTable extends ProductDetailsEntity {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String imageLink;

  @HiveField(3)
  final String price;

  @HiveField(4)
  final String description;

  @HiveField(5)
  final String rate;

  @HiveField(6)
  final CategoryTable? category;

  ProductFavoriteTable({
    required this.id,
    required this.name,
    required this.imageLink,
    required this.price,
    required this.description,
    required this.rate,
    required this.category,
  }) : super(
            id: id,
            name: name,
            imageLink: imageLink,
            price: price,
            description: description,
            rate: rate,
            category: category);

  factory ProductFavoriteTable.fromEntity(ProductDetailsEntity productEntity) {
    return ProductFavoriteTable(
      id: productEntity.id,
      name: productEntity.name,
      imageLink: productEntity.imageLink,
      price: productEntity.price,
      description: productEntity.description,
      rate: productEntity.rate,
      category: CategoryTable(
        id: productEntity.category!.id,
        imageLink: productEntity.category!.imageLink,
        name: productEntity.category!.name,
      ),
    );
  }
}

@HiveType(typeId: 1)
class CategoryTable extends CategoryEntity {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String imageLink;

  CategoryTable({
    required this.id,
    required this.name,
    required this.imageLink,
  }) : super(
          id: id,
          name: name,
          imageLink: imageLink,
        );

  factory CategoryTable.fromEntity(CategoryEntity categoryEntity) {
    return CategoryTable(
      id: categoryEntity.id,
      name: categoryEntity.name,
      imageLink: categoryEntity.imageLink,
    );
  }
}
