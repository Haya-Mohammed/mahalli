import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_list/customer_list_cubit.dart';
import 'package:mahalli/features/customers/presentation/widgets/customer_list_body.dart';

class CustomerListPage extends StatelessWidget {
  const CustomerListPage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocProvider(create: (_) => sl<CustomerListCubit>()..load(), child: const CustomerListBody());
}
