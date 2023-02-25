// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_favorite_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductFavoriteTableAdapter extends TypeAdapter<ProductFavoriteTable> {
  @override
  final int typeId = 0;

  @override
  ProductFavoriteTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductFavoriteTable(
      id: fields[0] as int,
      name: fields[1] as String,
      imageLink: fields[2] as String,
      price: fields[3] as String,
      description: fields[4] as String,
      rate: fields[5] as String,
      category: fields[6] as CategoryTable?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductFavoriteTable obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageLink)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.rate)
      ..writeByte(6)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductFavoriteTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryTableAdapter extends TypeAdapter<CategoryTable> {
  @override
  final int typeId = 1;

  @override
  CategoryTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryTable(
      id: fields[0] as int,
      name: fields[1] as String,
      imageLink: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryTable obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
