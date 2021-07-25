import 'package:flutter/material.dart';
import 'package:parts_tracker/features/inventory_item/data/models/inventory_part.dart';

class StockRow extends StatefulWidget {
  final InventoryPart inventoryPart;
  final VoidCallback deductCallback;
  final VoidCallback addCallback;
  const StockRow({
    Key? key,
    required this.deductCallback,
    required this.addCallback,
    required this.inventoryPart,
  }) : super(key: key);

  @override
  _StockRowState createState() => _StockRowState();
}

class _StockRowState extends State<StockRow> {
  var stockCount;

  @override
  void initState() {
    super.initState();
    _setStockCount();
  }

  _setStockCount() {
    setState(() {
      stockCount = widget.inventoryPart.inStock;
    });
  }

  @override
  Widget build(BuildContext context) {
    return stockCount == null
        ? Container()
        : Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    widget.deductCallback();
                  }),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  stockCount.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  widget.addCallback();
                },
              ),
            ],
          );
  }
}
