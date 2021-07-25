// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InventoryPart _$$_InventoryPartFromJson(Map<String, dynamic> json) =>
    _$_InventoryPart(
      isActive: json['isActive'] as bool?,
      cost: (json['cost'] as num?)?.toDouble(),
      id: json['id'] as int?,
      inStock: json['inStock'] as int?,
      partNumber: json['partNumber'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_InventoryPartToJson(_$_InventoryPart instance) =>
    <String, dynamic>{
      'isActive': instance.isActive,
      'cost': instance.cost,
      'id': instance.id,
      'inStock': instance.inStock,
      'partNumber': instance.partNumber,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
    };
