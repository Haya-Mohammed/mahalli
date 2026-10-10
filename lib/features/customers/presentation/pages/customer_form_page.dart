import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/features/customers/domain/models/customer_details.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_form/customer_form_cubits.dart';
import 'package:mahalli/features/customers/presentation/widgets/customer_form.dart';

class CustomerFormPage extends StatelessWidget {
  const CustomerFormPage({super.key, this.customer});
  final CustomerDetails? customer;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => sl<CustomerFormCubit>(),
    child: CustomerForm(customer: customer),
  );
}
