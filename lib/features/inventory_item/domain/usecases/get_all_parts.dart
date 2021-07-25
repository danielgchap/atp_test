import 'package:dartz/dartz.dart';
import 'package:parts_tracker/core/errors/failures/failure.dart';
import 'package:parts_tracker/features/inventory_item/data/models/inventory_part.dart';
import 'package:parts_tracker/features/inventory_item/domain/repositories/inventory_item_repository.dart';

class GetAllParts {
  InventoryItemRepository inventoryItemRepository;

  GetAllParts({
    required this.inventoryItemRepository,
  });

  Future<Either<Failure, InventoryParts>> call() async {
    return await inventoryItemRepository.getAllParts();
  }
}
