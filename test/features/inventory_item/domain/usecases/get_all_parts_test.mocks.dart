// Mocks generated by Mockito 5.0.12 from annotations
// in parts_tracker/test/features/inventory_item/domain/usecases/get_all_parts_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:parts_tracker/core/errors/failures/failure.dart' as _i5;
import 'package:parts_tracker/features/inventory_item/data/models/inventory_part.dart'
    as _i6;
import 'package:parts_tracker/features/inventory_item/domain/repositories/inventory_item_repository.dart'
    as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [InventoryItemRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockInventoryItemRepository extends _i1.Mock
    implements _i3.InventoryItemRepository {
  MockInventoryItemRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.InventoryParts>> getAllParts() =>
      (super.noSuchMethod(Invocation.method(#getAllParts, []),
              returnValue:
                  Future<_i2.Either<_i5.Failure, _i6.InventoryParts>>.value(
                      _FakeEither<_i5.Failure, _i6.InventoryParts>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.InventoryParts>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.InventoryParts>> getPartById(
          int? number) =>
      (super.noSuchMethod(Invocation.method(#getPartById, [number]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, _i6.InventoryParts>>.value(
                      _FakeEither<_i5.Failure, _i6.InventoryParts>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.InventoryParts>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.InventoryParts>> consumeForItem(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#consumeForItem, [id]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, _i6.InventoryParts>>.value(
                      _FakeEither<_i5.Failure, _i6.InventoryParts>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.InventoryParts>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.InventoryParts>> receiveStockForItem(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#receiveStockForItem, [id]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, _i6.InventoryParts>>.value(
                      _FakeEither<_i5.Failure, _i6.InventoryParts>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.InventoryParts>>);
}
