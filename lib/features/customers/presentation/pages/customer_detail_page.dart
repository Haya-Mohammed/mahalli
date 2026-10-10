import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_detail/customer_detail_cubit.dart';
import 'package:mahalli/features/customers/presentation/widgets/customer_detail_body.dart';

class CustomerDetailPage extends StatelessWidget {
  const CustomerDetailPage({super.key, required this.customerId});
  final int customerId;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => sl<CustomerDetailCubit>()..load(customerId),
    child: CustomerDetailBody(customerId: customerId),
  );
}
