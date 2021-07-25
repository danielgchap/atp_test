import 'package:dartz/dartz.dart';
import 'package:parts_tracker/core/errors/failures/failure.dart';
import 'package:parts_tracker/features/inventory_item/data/models/inventory_part.dart';
import 'package:parts_tracker/features/inventory_item/domain/repositories/inventory_item_repository.dart';

class GetPartById {
  final InventoryItemRepository inventoryItemRepository;

  const GetPartById({required this.inventoryItemRepository});

  Future<Either<Failure, InventoryParts>> call(int number) async {
    return await inventoryItemRepository.getPartById(number);
  }
}
