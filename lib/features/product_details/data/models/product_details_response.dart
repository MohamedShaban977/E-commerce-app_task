

import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';

import '../../domain/entities/product_details_entity.dart';

class ProductDetailsResponse extends ProductDetailsEntity {
  ProductDetailsResponse({
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

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      ProductDetailsResponse(
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


  factory ProductDetailsResponse.fromHive(Map<dynamic, dynamic> json) => ProductDetailsResponse(
    id: json["id"],
    name: json["name"],
    imageLink: json["image_link"],
    price: json["price"],
    description: json["description"],
    rate: json["rate"],
    category: json["category"] == null
        ? null
        : Category.fromHive(json["category"]),
  );
  Map<String, dynamic> toJsonHive() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['name'] = name;
    data['image_link'] = imageLink;
    data['price'] = price;
    data['description'] = description;
    data['rate'] = rate;
    if (category != null) {
      data['category'] = category;
    }
    return data;
  }
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

  factory Category.fromHive(Map<dynamic, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    imageLink: json["image_link"],
  );
  Map<String, dynamic> toJsonHive() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['name'] = name;
    data['image_link'] = imageLink;
    return data;
  }
}
