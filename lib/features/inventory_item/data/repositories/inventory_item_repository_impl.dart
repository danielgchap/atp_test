// class InventoryPartRepositoryImpl implements Reposit

import 'package:parts_tracker/core/platform/network_info.dart';
import 'package:parts_tracker/features/inventory_item/data/datasources/inventory_part_remote_data_source.dart';
import 'package:parts_tracker/features/inventory_item/data/models/inventory_part.dart';
import 'package:parts_tracker/core/errors/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:parts_tracker/features/inventory_item/domain/repositories/inventory_item_repository.dart';

class InventoryItemRepositoryImpl implements InventoryItemRepository {
  final InventoryPartRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  InventoryItemRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, InventoryParts>> getAllParts() async {
    networkInfo.isConnected;
    final parts = await remoteDataSource.getAllParts();
    return Right(parts);
  }

  @override
  Future<Either<Failure, InventoryParts>> getPartById(int number) async {
    networkInfo.isConnected;
    final part = await remoteDataSource.getPartById(number);
    return Right(part);
  }

  @override
  Future<Either<Failure, InventoryParts>> consumeForItem(int id) async {
    networkInfo.isConnected;
    final part = await remoteDataSource.consumeForItem(id);
    return Right(part);
  }

  @override
  Future<Either<Failure, InventoryParts>> receiveStockForItem(int id) async {
    networkInfo.isConnected;
    final part = await remoteDataSource.receiveStockForItem(id);
    return Right(part);
  }
}
