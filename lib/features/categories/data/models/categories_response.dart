import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/features/categories/domain/entities/categories_entity.dart';

class CategoriesResponse extends CategoriesEntity {
  CategoriesResponse({
    final int? id,
    final String? name,
    final String? imageLink,
  }) : super(
      id: id.orZero(),
      name: name.orEmpty(),
      imageLink: imageLink.orEmpty());

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => CategoriesResponse(
    id: json["id"],
    name: json["name"],
    imageLink: json["image_link"],
  );


}
