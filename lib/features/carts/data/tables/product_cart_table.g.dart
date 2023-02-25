// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_cart_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductCartTableAdapter extends TypeAdapter<ProductCartTable> {
  @override
  final int typeId = 2;

  @override
  ProductCartTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductCartTable(
      id: fields[0] as int,
      name: fields[1] as String,
      imageLink: fields[2] as String,
      price: fields[3] as String,
      description: fields[4] as String,
      rate: fields[5] as String,
      category: fields[6] as CategoryTable?,
      quantity: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProductCartTable obj) {
    writer
      ..writeByte(8)
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
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductCartTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
