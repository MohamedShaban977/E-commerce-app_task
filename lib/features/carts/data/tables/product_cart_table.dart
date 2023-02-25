import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:hive/hive.dart';

import '../../../product_details/domain/entities/product_details_entity.dart';
import '../../../wishlist/data/tables/product_favorite_table.dart';

part 'product_cart_table.g.dart';

@HiveType(typeId: 2)
class ProductCartTable extends ProductDetailsEntity {
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

  @HiveField(7)
  final int quantity;

  ProductCartTable({
    required this.id,
    required this.name,
    required this.imageLink,
    required this.price,
    required this.description,
    required this.rate,
    required this.category,
    required this.quantity,
  }) : super(
            id: id,
            name: name,
            imageLink: imageLink,
            price: price,
            description: description,
            rate: rate,
            category: category,
            quantity: quantity);

  factory ProductCartTable.fromEntity(ProductDetailsEntity productEntity) {
    return ProductCartTable(
      id: productEntity.id,
      name: productEntity.name,
      imageLink: productEntity.imageLink,
      price: productEntity.price,
      description: productEntity.description,
      rate: productEntity.rate,
      quantity: productEntity.quantity.orZero(),
      category: CategoryTable(
        id: productEntity.category!.id,
        imageLink: productEntity.category!.imageLink,
        name: productEntity.category!.name,
      ),
    );
  }
}
