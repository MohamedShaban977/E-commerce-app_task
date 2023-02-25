import 'package:equatable/equatable.dart';


class ProductDetailsEntity extends Equatable {
final int id;
final String name;
final String imageLink;
final String price;
final String description;
final String rate;
final CategoryEntity? category;
 int? quantity ;

 ProductDetailsEntity(
{required this.id,
required this.name,
required this.imageLink,
required this.price,
required this.description,
required this.rate,
required this.category,
 this.quantity=1, });

@override
List<Object?> get props => [id,name,imageLink,price,description,rate,category,quantity];

}

class CategoryEntity extends Equatable {

final int id;
final String name;
final String imageLink;

const CategoryEntity({required this.id, required this.name,required this.imageLink});

@override
List<Object?> get props => [id,name,imageLink];
}