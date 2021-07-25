import 'package:dartz/dartz.dart';
import 'package:parts_tracker/core/errors/failures/failure.dart';
import 'package:parts_tracker/features/inventory_item/data/models/inventory_part.dart';

abstract class InventoryItemRepository {
  Future<Either<Failure, InventoryParts>> getAllParts();
  Future<Either<Failure, InventoryParts>> getPartById(int number);
  Future<Either<Failure, InventoryParts>> consumeForItem(int id);
  Future<Either<Failure, InventoryParts>> receiveStockForItem(int id);
}
