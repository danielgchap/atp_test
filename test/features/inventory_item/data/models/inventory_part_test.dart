import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:parts_tracker/features/inventory_item/data/models/inventory_part.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tInventoryItem = InventoryPart(
    id: 1,
    cost: 7.99,
    partNumber: "158CDWS1",
    name:
        "Grip-Rite 158CDWS1 1-5/8-Inch 6 Coarse Thread Drywall Screw with Bugle Head, 1 Pound",
    description:
        "Exclusive FILTECH media technology screens out more harmful contaminants for greater engine protection. Strong steel base plates and housings prevent warpage, leaks and poor fit. Silicone anti-drain back valve ensures a supply of clean oil when the car is started. High lubricity gasket design provides a tight seal, yet easy removal. Double-locked rolled seam forms a leak free canister.",
    isActive: true,
    image: "http://localhost:9001/images/drywallscrews.jpg",
    inStock: 3,
  );

  test('should create InventoryPart model from json', () {
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('inventory_part_test_data.json'));

    final result = InventoryPart.fromJson(jsonMap);
    expect(result, tInventoryItem);
  });
}
