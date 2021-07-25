import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parts_tracker/features/inventory_item/data/models/inventory_part.dart';
import 'package:parts_tracker/features/inventory_item/domain/repositories/inventory_item_repository.dart';
import 'package:parts_tracker/features/inventory_item/domain/usecases/get_all_parts.dart';

import 'get_all_parts_test.mocks.dart';

@GenerateMocks([InventoryItemRepository])
void main() {
  GetAllParts? usecase;
  var mockInventoryItemRepository = MockInventoryItemRepository();

  setUp(() {
    usecase = GetAllParts(inventoryItemRepository: mockInventoryItemRepository);
  });

  const tInventoryItem = InventoryParts(inventoryItems: [
    InventoryPart(
        isActive: true,
        cost: 3.99,
        id: 1,
        inStock: 5,
        partNumber: "123",
        name: "testName",
        description: "testDesc",
        image: "imageURL")
  ]);

  test('should get all parts from repository', () async {
    when(mockInventoryItemRepository.getAllParts())
        .thenAnswer((_) async => const Right(tInventoryItem));

    final result = await usecase!();
    expect(result, const Right(tInventoryItem));
    verify(mockInventoryItemRepository.getAllParts());
    verifyNoMoreInteractions(mockInventoryItemRepository);
  });
}
