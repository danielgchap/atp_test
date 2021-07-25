import 'package:bloc/bloc.dart';
import 'package:parts_tracker/core/errors/failures/failure.dart';
import 'package:parts_tracker/features/inventory_item/data/models/inventory_part.dart';
import 'package:parts_tracker/features/inventory_item/data/repositories/inventory_item_repository_impl.dart';
import 'package:sealed_unions/factories/quartet_factory.dart';
import 'package:sealed_unions/implementations/union_4_impl.dart';
import 'package:sealed_unions/union_4.dart';

part 'inventory_part_state.dart';

class InventoryPartCubit extends Cubit<InventoryPartState> {
  InventoryItemRepositoryImpl inventoryItemRepositoryImpl;

  InventoryPartCubit({required this.inventoryItemRepositoryImpl})
      : super(InventoryPartState.initial());

  Future<void> fetchPartOrParts(int? id) async {
    try {
      var result;
      emit(InventoryPartState.loading());
      if (id != null) {
        result = await inventoryItemRepositoryImpl.getPartById(id);
      } else {
        result = await inventoryItemRepositoryImpl.getAllParts();
      }
      result.fold(
        (l) => throw ServerFailure(),
        (r) => emit(InventoryPartState.loaded(r)),
      );
    } on ServerFailure {
      emit(InventoryPartState.error('getAllParts cubit request failed'));
    }
  }

  Future<void> consumeInventoryItem(int id) async {
    emit(InventoryPartState.loading());
    try {
      var result = await inventoryItemRepositoryImpl.consumeForItem(id);
      result.fold(
        (l) => throw ServerFailure(),
        (r) => emit(InventoryPartState.loaded(r)),
      );
    } on ServerFailure {
      emit(InventoryPartState.error('consumeInventoryItem failed'));
    }
  }

  Future<void> receiveStockForItem(int id) async {
    emit(InventoryPartState.loading());
    try {
      var result = await inventoryItemRepositoryImpl.receiveStockForItem(id);
      result.fold(
        (l) => throw ServerFailure(),
        (r) => emit(InventoryPartState.loaded(r)),
      );
    } on ServerFailure {
      emit(InventoryPartState.error('consumeInventoryItem failed'));
    }
  }
}
