import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parts_tracker/core/platform/network_info.dart';
import 'package:parts_tracker/features/inventory_item/data/datasources/inventory_part_remote_data_source.dart';
import 'package:parts_tracker/features/inventory_item/data/models/inventory_part.dart';
import 'package:parts_tracker/features/inventory_item/data/repositories/inventory_item_repository_impl.dart';
import 'package:parts_tracker/features/inventory_item/presentation/cubit/cubit/inventory_part_cubit.dart';
import 'package:parts_tracker/features/inventory_item/presentation/widgets/list_page_card_item.dart';
import 'package:parts_tracker/global.dart';
import 'package:http/http.dart' as http;

import 'inventory_detail_page.dart';

class InventoryListPage extends StatefulWidget {
  const InventoryListPage({Key? key}) : super(key: key);

  @override
  _InventoryListPageState createState() => _InventoryListPageState();
}

class _InventoryListPageState extends State<InventoryListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _fetchAllParts(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          TextConstants.inventoryAppBarTitle,
        ),
      ),
      body: BlocBuilder<InventoryPartCubit, InventoryPartState>(
        builder: (context, state) {
          return state.join(
            (initial) => _buildLoading(),
            (loading) => _buildLoading(),
            (loaded) => _buildLoaded(loaded.inventoryParts),
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

  Widget _buildLoaded(InventoryParts inventoryParts) {
    return ListPageBody(
      partsList: inventoryParts.inventoryItems!,
      callback: () {
        _fetchAllParts(context);
      },
    );
  }

  Widget _buildError(String errorMessage) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _fetchAllParts(BuildContext context) {
    final inventoryCubit = context.read<InventoryPartCubit>();
    inventoryCubit.fetchPartOrParts(null);
  }
}

class ListPageBody extends StatelessWidget {
  final List partsList;
  final VoidCallback callback;
  const ListPageBody({
    Key? key,
    required this.partsList,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (partsList.isEmpty) {
      return const Center(child: Text('No Parts Found.'));
    }
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: partsList.length,
            itemBuilder: (context, index) {
              final part = InventoryPart.fromJson(partsList[index]);
              return InkWell(
                onTap: () {
                  _handleCardTap(context, part);
                },
                child: ListPageCardItem(inventoryPart: part),
              );
            },
          )
        ],
      ),
    );
  }

  _handleCardTap(BuildContext context, InventoryPart inventoryPart) async {
    //TODO: this can be segregated using the auto_route package (pass a blocprovider to a nested route of screens. Time constraint)
    //TODO: GetX can be used for all these dependencies:

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => InventoryPartCubit(
              inventoryItemRepositoryImpl: InventoryItemRepositoryImpl(
                  remoteDataSource: InventoryPartRemoteDataSourceImpl(
                    client: http.Client(),
                  ),
                  networkInfo: NetworkInfoImpl(
                    dataConnectionChecker: DataConnectionChecker(),
                  ))),
          child: InventoryDetailPage(
            inventoryPart: inventoryPart,
          ),
        ),
      ),
    );
    callback();
  }
}
