import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/features/sales/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:mahalli/features/sales/presentation/widgets/sales_body.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key, required this.onOpenInventory, this.refreshToken = 0});
  final VoidCallback onOpenInventory;

  final int refreshToken;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [BlocProvider(create: (_) => sl<CartCubit>())],
    child: SalesBody(onOpenInventory: onOpenInventory, refreshToken: refreshToken),
  );
}
