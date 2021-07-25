import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';

part 'inventory_part.freezed.dart';
part 'inventory_part.g.dart';

@freezed
class InventoryPart with _$InventoryPart {
  const factory InventoryPart({
    bool? isActive,
    double? cost,
    int? id,
    int? inStock,
    String? partNumber,
    String? name,
    String? description,
    String? image,
  }) = _InventoryPart;

  factory InventoryPart.fromJson(Map<String, dynamic> json) =>
      _$InventoryPartFromJson(json);
}

@freezed
class InventoryParts with _$InventoryParts {
  const factory InventoryParts({List? inventoryItems}) = _InventoryParts;
}
