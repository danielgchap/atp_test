part of 'inventory_part_cubit.dart';

class InventoryPartState extends Union4Impl<_InventoryPartInitial,
    _InventoryPartLoading, _InventoryPartLoaded, _InventoryPartError> {
  static const _factory = Quartet<_InventoryPartInitial, _InventoryPartLoading,
      _InventoryPartLoaded, _InventoryPartError>();

  InventoryPartState._(
    Union4<_InventoryPartInitial, _InventoryPartLoading, _InventoryPartLoaded,
            _InventoryPartError>
        union,
  ) : super(union);

  factory InventoryPartState.initial() =>
      InventoryPartState._(_factory.first(_InventoryPartInitial()));

  factory InventoryPartState.loading() =>
      InventoryPartState._(_factory.second(_InventoryPartLoading()));

  factory InventoryPartState.loaded(InventoryParts inventoryParts) =>
      InventoryPartState._(
          _factory.third(_InventoryPartLoaded(inventoryParts: inventoryParts)));

  factory InventoryPartState.error(String message) => InventoryPartState._(
      _factory.fourth(_InventoryPartError(errorMesage: message)));
}

class _InventoryPartInitial {}

class _InventoryPartLoading {}

class _InventoryPartLoaded {
  final InventoryParts inventoryParts;

  _InventoryPartLoaded({required this.inventoryParts});
}

class _InventoryPartError {
  final String errorMesage;

  _InventoryPartError({required this.errorMesage});
}
