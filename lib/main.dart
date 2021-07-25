import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:parts_tracker/core/platform/network_info.dart';
import 'package:parts_tracker/features/inventory_item/data/datasources/inventory_part_remote_data_source.dart';
import 'package:parts_tracker/features/inventory_item/data/repositories/inventory_item_repository_impl.dart';
import 'package:parts_tracker/features/inventory_item/presentation/cubit/cubit/inventory_part_cubit.dart';
import 'package:parts_tracker/features/inventory_item/presentation/pages/inventory_list_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATP Test',
      home: BlocProvider(
        create: (context) => InventoryPartCubit(
            inventoryItemRepositoryImpl: InventoryItemRepositoryImpl(
                remoteDataSource: InventoryPartRemoteDataSourceImpl(
                  client: http.Client(),
                ),
                networkInfo: NetworkInfoImpl(
                  dataConnectionChecker: DataConnectionChecker(),
                ))),
        child: const InventoryListPage(),
      ),
    );
  }
}
