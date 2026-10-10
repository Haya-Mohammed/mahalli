import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/features/catalog/domain/models/catalog_item.dart';
import 'package:mahalli/features/catalog/presentation/widgets/catalog_form.dart';

import '../cubit/catalog_cubit.dart';

class CatalogFormPage extends StatelessWidget {
  const CatalogFormPage({super.key, required this.type, this.item, this.initialBarcode});
  final ItemType type;
  final CatalogItem? item;
  final String? initialBarcode;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => sl<CatalogFormCubit>(),
    child: CatalogForm(type: type, item: item, initialBarcode: initialBarcode),
  );
}
