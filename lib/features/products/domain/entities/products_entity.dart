/*
{
"id": 1,
"name": "Shawrma",
"image_link": "https://www.aheadofthyme.com/wp-content/uploads/2021/07/chicken-shawarma-2-683x1024.jpg",
"price": "20.00",
"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
"rate": "0.0",
"category": {
"id": 1,
"name": "Food",
"image_link": "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/assortment-of-colorful-ripe-tropical-fruits-top-royalty-free-image-995518546-1564092355.jpg"
}
}

*/
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
  List<Object?> get props => [id,name,imageLink,price,description,rate,category];

}

class CategoryEntity extends Equatable {

  final int id;
  final String name;
  final String imageLink;

  const CategoryEntity({required this.id, required this.name,required this.imageLink});

  @override
  List<Object?> get props => [id,name,imageLink];
}