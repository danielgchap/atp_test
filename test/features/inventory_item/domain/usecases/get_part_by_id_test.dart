import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parts_tracker/features/inventory_item/data/models/inventory_part.dart';
import 'package:parts_tracker/features/inventory_item/domain/repositories/inventory_item_repository.dart';
import 'package:parts_tracker/features/inventory_item/domain/usecases/get_part_by_id.dart';

import 'get_all_parts_test.mocks.dart';

@GenerateMocks([InventoryItemRepository])
void main() {
  GetPartById? usecase;
  var mockInventoryItemRepository = MockInventoryItemRepository();

  setUp(() {
    usecase = GetPartById(inventoryItemRepository: mockInventoryItemRepository);
  });

  const tInventoryItem = InventoryParts(inventoryItems: [
    InventoryPart(
        isActive: true,
        cost: 3.99,
        id: 1,
        inStock: 5,
        partNumber: "123",
        name: "testNamePartById",
        description: "testDescPartById",
        image: "imageURLPartById")
  ]);

  test('should get all part from repository by id prop', () async {
    when(mockInventoryItemRepository.getPartById(1))
        .thenAnswer((_) async => const Right(tInventoryItem));

    final result = await usecase!(1);
    expect(result, const Right(tInventoryItem));
    verify(mockInventoryItemRepository.getPartById(1));
    verifyNoMoreInteractions(mockInventoryItemRepository);
  });
}
