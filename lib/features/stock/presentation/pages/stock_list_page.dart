import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/features/stock/presentation/cubits/stock_list/stock_list_cubit.dart';
import 'package:mahalli/features/stock/presentation/widgets/stock_list_body.dart';

class StockListPage extends StatelessWidget {
  const StockListPage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocProvider(create: (_) => sl<StockListCubit>()..load(), child: const StockListBody());
}
