import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/features/stock/presentation/cubits/stock_details/stock_details_cubit.dart';
import 'package:mahalli/features/stock/presentation/widgets/stock_detail_body.dart';

class StockDetailPage extends StatelessWidget {
  const StockDetailPage({super.key, required this.productId});
  final int productId;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => sl<StockDetailCubit>()..load(productId),
    child: StockDetailBody(productId: productId),
  );
}
