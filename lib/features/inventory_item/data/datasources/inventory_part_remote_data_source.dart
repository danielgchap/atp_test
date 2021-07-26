import 'dart:convert';

import 'package:parts_tracker/core/errors/failures/failure.dart';
import 'package:parts_tracker/features/inventory_item/data/models/inventory_part.dart';
import 'package:http/http.dart' as http;
import 'package:parts_tracker/global.dart';

abstract class InventoryPartRemoteDataSource {
  Future<InventoryParts> getAllParts();
  Future<InventoryParts> getPartById(int number);
  Future<InventoryParts> consumeForItem(int id);
  Future<InventoryParts> receiveStockForItem(int id);
}

class InventoryPartRemoteDataSourceImpl
    implements InventoryPartRemoteDataSource {
  final http.Client client;

  InventoryPartRemoteDataSourceImpl({required this.client});

  @override
  Future<InventoryParts> getAllParts() async {
    final response = await client.get(
      Uri.parse(URLConstants.getAllItemsURL),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      List responseMap = await json.decode(response.body);
      return InventoryParts(inventoryItems: responseMap);
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<InventoryParts> getPartById(int number) async {
    final response = await client.get(
      Uri.parse('${URLConstants.getAllItemsURL}/$number'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      InventoryPart part = InventoryPart.fromJson(json.decode(response.body));
      return InventoryParts(inventoryItems: [part]);
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<InventoryParts> consumeForItem(int id) async {
    final response = await client.put(
      Uri.parse(
          '${URLConstants.getAllItemsURL}/${id.toString()}/${URLConstants.consumeURLTail}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({"quantity": 1}),
    );

    if (response.statusCode == 200) {
      print('Consume Success:\n\n ${response.body}');
      InventoryPart part = InventoryPart.fromJson(json.decode(response.body));
      return InventoryParts(inventoryItems: [part]);
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<InventoryParts> receiveStockForItem(int id) async {
    final response = await client.put(
      Uri.parse(
          '${URLConstants.getAllItemsURL}/${id.toString()}/${URLConstants.receiveURLTail}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({"quantity": 1}),
    );

    if (response.statusCode == 200) {
      print('Receiving Success:\n\n ${response.body}');
      InventoryPart part = InventoryPart.fromJson(json.decode(response.body));
      return InventoryParts(inventoryItems: [part]);
    } else {
      throw ServerFailure();
    }
  }
}
