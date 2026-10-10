import 'package:mahalli/core/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/features/catalog/domain/models/catalog_item.dart';
import 'package:mahalli/features/catalog/domain/models/product_input.dart';
import 'package:mahalli/features/catalog/domain/models/service_input.dart';
import 'package:mahalli/features/catalog/presentation/cubit/catalog_cubit.dart';
import 'package:mahalli/features/categories/domain/models/category_Model.dart';
import 'package:mahalli/features/categories/domain/repository/category_repository.dart';
import 'package:mahalli/features/onboarding/presentation/cubit/shop_cubit.dart';

class CatalogForm extends StatefulWidget {
  const CatalogForm({required this.type, this.item, this.initialBarcode});
  final ItemType type;
  final CatalogItem? item;
  final String? initialBarcode;

  @override
  State<CatalogForm> createState() => _CatalogFormState();
}

class _CatalogFormState extends State<CatalogForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name = TextEditingController(
    text: widget.item?.name,
  );
  late final TextEditingController _barcode = TextEditingController(
    text: widget.item?.barcode ?? widget.initialBarcode,
  );
  late final TextEditingController _sku = TextEditingController(
    text: widget.item?.sku,
  );
  late final TextEditingController _selling = TextEditingController();
  late final TextEditingController _cost = TextEditingController();
  late final TextEditingController _opening = TextEditingController();
  late final TextEditingController _threshold = TextEditingController();
  late final Future<List<CategoryModel>> _categories = sl<CategoryRepository>()
      .list();
  UnitType _unit = UnitType.piece;
  int? _categoryId;
  String? _barcodeError;
  String? _formError;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;
    _initialized = true;
    final item = widget.item;
    final currency = context.read<ShopCubit>().state.shop?.currency ?? 'ILS';
    _selling.text = item == null
        ? ''
        : Money(item.sellingPrice).format(currency: currency);
    _cost.text = item == null
        ? ''
        : Money(item.cost).format(currency: currency);
    _threshold.text = item == null
        ? ''
        : Quantity(item.lowStockThresholdMilli).format();
    _unit = item?.unit ?? UnitType.piece;
    _categoryId = item?.categoryId;
  }

  @override
  void dispose() {
    for (final controller in [
      _name,
      _barcode,
      _sku,
      _selling,
      _cost,
      _opening,
      _threshold,
    ]) {
      controller.dispose();
    }
    super.dispose();
  }

  String get _currency =>
      context.read<ShopCubit>().state.shop?.currency ?? 'ILS';

  String? _priceValidator(String? value, {bool positive = false}) {
    final money = Money.tryParse(
      value?.trim().isEmpty == true ? '0' : value,
      currency: _currency,
    );
    if (money == null) return context.l10n.enterPrice;
    if (positive && money.minor <= 0) return context.l10n.priceMustBePositive;
    return null;
  }

  String? _quantityValidator(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    return Quantity.tryParse(value) == null ? context.l10n.invalidNumber : null;
  }

  int _amount(TextEditingController c) => Money.tryParse(
    c.text.trim().isEmpty ? '0' : c.text,
    currency: _currency,
  )!.minor;
  int _quantity(TextEditingController c) =>
      Quantity.tryParse(c.text.trim().isEmpty ? '0' : c.text)!.milli;

  Future<void> _scan() async {
    final value = await Navigator.of(
      context,
    ).pushNamed<String>(AppRoutes.barcodeScanner);
    if (mounted && value != null) {
      setState(() {
        _barcode.text = value;
        _barcodeError = null;
      });
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final cubit = context.read<CatalogFormCubit>();
    setState(() {
      _barcodeError = null;
      _formError = null;
    });
    final result = widget.type == ItemType.product
        ? await cubit.saveProduct(
            ProductInput(
              name: _name.text,
              sellingPrice: _amount(_selling),
              purchasePrice: _amount(_cost),
              unit: _unit,
              lowStockThresholdMilli: _quantity(_threshold),
              openingStockMilli: widget.item == null ? _quantity(_opening) : 0,
              categoryId: _categoryId,
              barcode: _barcode.text,
              sku: _sku.text,
            ),
            id: widget.item?.id,
          )
        : await cubit.saveService(
            ServiceInput(
              name: _name.text,
              sellingPrice: _amount(_selling),
              cost: _amount(_cost),
              categoryId: _categoryId,
            ),
            id: widget.item?.id,
          );
    if (!mounted) return;
    if (result == CatalogSaveStatus.saved) {
      Navigator.of(context).pop(true);
    } else {
      setState(() {
        if (result == CatalogSaveStatus.duplicateBarcode) {
          _barcodeError = context.l10n.barcodeInUse;
        } else {
          _formError = result == CatalogSaveStatus.invalid
              ? context.l10n.invalidData
              : context.l10n.saveFailed;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final product = widget.type == ItemType.product;
    final editing = widget.item != null;
    final busy = context.watch<CatalogFormCubit>().state.busy;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product
              ? (editing ? l.editProduct : l.addProduct)
              : (editing ? l.editService : l.addService),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Icon(
                      product
                          ? Icons.inventory_2_outlined
                          : Icons.design_services_outlined,
                      size: 36,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product
                          ? (editing ? l.editProduct : l.addProduct)
                          : (editing ? l.editService : l.addService),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 18),
                    TextFormField(
                      key: const Key('catalog_name'),
                      controller: _name,
                      maxLength: 100,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        labelText: product ? l.productName : l.serviceName,
                      ),
                      validator: (value) =>
                          value == null || value.trim().isEmpty
                          ? l.requiredField
                          : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      key: const Key('catalog_selling'),
                      controller: _selling,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: InputDecoration(
                        labelText: l.sellingPrice,
                        prefixText:
                            '${context.money(Money.zero).split(' ').first} ',
                      ),
                      validator: (value) =>
                          _priceValidator(value, positive: true),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _cost,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: InputDecoration(
                        labelText: product ? l.purchasePrice : l.cost,
                      ),
                      validator: (value) => _priceValidator(value),
                    ),
                    const SizedBox(height: 12),
                    FutureBuilder<List<CategoryModel>>(
                      future: _categories,
                      builder: (context, snapshot) {
                        final categories = (snapshot.data ?? [])
                            .where(
                              (c) =>
                                  c.type == widget.type &&
                                  (c.isActive || c.id == _categoryId),
                            )
                            .toList();
                        return DropdownButtonFormField<int?>(
                          key: ValueKey(
                            '${snapshot.connectionState}-$_categoryId',
                          ),
                          initialValue:
                              categories.any((c) => c.id == _categoryId)
                              ? _categoryId
                              : null,
                          decoration: InputDecoration(labelText: l.category),
                          items: [
                            DropdownMenuItem<int?>(
                              value: null,
                              child: Text(l.none),
                            ),
                            ...categories.map(
                              (c) => DropdownMenuItem<int?>(
                                value: c.id,
                                child: Text(c.name),
                              ),
                            ),
                          ],
                          onChanged: (value) =>
                              setState(() => _categoryId = value),
                        );
                      },
                    ),
                    if (product) ...[
                      const SizedBox(height: 12),
                      TextFormField(
                        key: const Key('catalog_barcode'),
                        controller: _barcode,
                        decoration: InputDecoration(
                          labelText: l.barcode,
                          errorText: _barcodeError,
                          suffixIcon: IconButton(
                            tooltip: l.scanBarcode,
                            onPressed: _scan,
                            icon: const Icon(Icons.qr_code_scanner),
                          ),
                        ),
                        onChanged: (_) {
                          if (_barcodeError != null) {
                            setState(() => _barcodeError = null);
                          }
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _sku,
                        decoration: InputDecoration(labelText: l.sku),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<UnitType>(
                        initialValue: _unit,
                        decoration: InputDecoration(labelText: l.unit),
                        items: UnitType.values
                            .map(
                              (unit) => DropdownMenuItem(
                                value: unit,
                                child: Text(l.unitLabel(unit)),
                              ),
                            )
                            .toList(),
                        onChanged: (value) =>
                            setState(() => _unit = value ?? UnitType.piece),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _threshold,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: InputDecoration(
                          labelText: l.lowStockThreshold,
                        ),
                        validator: _quantityValidator,
                      ),
                      const SizedBox(height: 12),
                      if (!editing)
                        TextFormField(
                          key: const Key('catalog_opening'),
                          controller: _opening,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          decoration: InputDecoration(
                            labelText: l.openingStock,
                          ),
                          validator: _quantityValidator,
                        )
                      else
                        Text(l.stockManagedHint),
                    ],
                    if (_formError != null) ...[
                      const SizedBox(height: 12),
                      Text(
                        _formError!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: busy ? null : _save,
                      child: Text(l.save),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
