// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 0;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      productID: fields[0] as String,
      productName: fields[1] as String,
      productAbout: fields[2] as String,
      category: fields[3] as String?,
      photoUrl: fields[4] as String,
      productStar: fields[5] as double,
      productAmount: fields[7] as int,
      productPrice: fields[6] as int,
      createdAtMilliSecond: fields[8] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.productID)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.productAbout)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.photoUrl)
      ..writeByte(5)
      ..write(obj.productStar)
      ..writeByte(6)
      ..write(obj.productPrice)
      ..writeByte(7)
      ..write(obj.productAmount)
      ..writeByte(8)
      ..write(obj.createdAtMilliSecond);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
