import 'package:flutter/material.dart';
import 'package:parts_tracker/core/utils/proxy_handler.dart';
import 'package:parts_tracker/features/inventory_item/data/models/inventory_part.dart';

class DetailPageBody extends StatelessWidget {
  final InventoryPart inventoryPart;
  const DetailPageBody({
    Key? key,
    required this.inventoryPart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerStack(),
          ],
        ),
      ),
    );
  }

  Widget _headerStack() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        inventoryPart.image != null
            ? Container(
                alignment: Alignment.center,
                height: 100,
                child: Image.network(
                  ProxyHandler.convertURLForImage(inventoryPart.image!),
                ),
              )
            : Container(),
        Text(
          inventoryPart.name!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'isActive: ${inventoryPart.isActive.toString()}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: inventoryPart.isActive == true
                ? Colors.greenAccent
                : Colors.redAccent,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(inventoryPart.description.toString()),
      ],
    );
  }
}
