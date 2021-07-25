import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parts_tracker/features/inventory_item/data/models/inventory_part.dart';
import 'package:parts_tracker/features/inventory_item/presentation/cubit/cubit/inventory_part_cubit.dart';
import 'package:parts_tracker/features/inventory_item/presentation/widgets/detail_page_body.dart';
import 'package:parts_tracker/features/inventory_item/presentation/widgets/stock_row.dart';
import 'package:parts_tracker/global.dart';

class InventoryDetailPage extends StatefulWidget {
  final InventoryPart inventoryPart;
  const InventoryDetailPage({
    Key? key,
    required this.inventoryPart,
  }) : super(key: key);

  @override
  _InventoryDetailPageState createState() => _InventoryDetailPageState();
}

class _InventoryDetailPageState extends State<InventoryDetailPage> {
  InventoryPartCubit? inventoryCubit;

  @override
  Widget build(BuildContext context) {
    _fetchInventoryItem(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextConstants.itemDetailPageTitle),
      ),
      body: BlocBuilder<InventoryPartCubit, InventoryPartState>(
        builder: (context, state) {
          return state.join(
            (initial) => _buildLoading(),
            (loading) => _buildLoading(),
            (loaded) => _buildLoaded(context, loaded.inventoryParts),
            (error) => _buildError(error.errorMesage),
          );
        },
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.greenAccent,
      ),
    );
  }

  Widget _buildLoaded(BuildContext context, InventoryParts inventoryParts) {
    return Column(
      children: [
        DetailPageBody(inventoryPart: inventoryParts.inventoryItems!.first),
        const SizedBox(
          height: 20,
        ),
        StockRow(
          inventoryPart: inventoryParts.inventoryItems!.first,
          deductCallback: () {
            _triggerConsumingForItem(context);
          },
          addCallback: () {
            _triggerReceivingForItem(context);
          },
        ),
      ],
    );
  }

  Widget _buildError(String errorMessage) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _fetchInventoryItem(BuildContext context) {
    inventoryCubit = context.read<InventoryPartCubit>();
    inventoryCubit!.fetchPartOrParts(widget.inventoryPart.id);
  }

  _triggerReceivingForItem(BuildContext context) {
    inventoryCubit!.receiveStockForItem(widget.inventoryPart.id!);
  }

  _triggerConsumingForItem(BuildContext context) {
    inventoryCubit!.consumeInventoryItem(widget.inventoryPart.id!);
  }
}
