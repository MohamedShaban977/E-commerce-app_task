import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/features/products/domain/entities/products_entity.dart';

class ProductsResponse extends ProductsEntity {
  ProductsResponse({
    final int? id,
    final String? name,
    final String? imageLink,
    final String? price,
    final String? description,
    final String? rate,
    final Category? category,
  }) : super(
            id: id.orZero(),
            name: name.orEmpty(),
            imageLink: imageLink.orEmpty(),
            price: price.orEmpty(),
            description: description.orEmpty(),
            rate: rate.orEmpty(),
            category: category);

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      ProductsResponse(
        id: json["id"],
        name: json["name"],
        imageLink: json["image_link"],
        price: json["price"],
        description: json["description"],
        rate: json["rate"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
      );
}

class Category extends CategoryEntity {
  Category({
    final int? id,
    final String? name,
    final String? imageLink,
  }) : super(
          id: id.orZero(),
          name: name.orEmpty(),
          imageLink: imageLink.orEmpty(),
        );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        imageLink: json["image_link"],
      );
}
