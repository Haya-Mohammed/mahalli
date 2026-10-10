import 'package:mahalli/core/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/core/widgets/state_views.dart';
import 'package:mahalli/features/expenses/domain/models/expense_category_model.dart';
import 'package:mahalli/features/expenses/domain/models/expense_model.dart';
import 'package:mahalli/features/expenses/domain/repository/expense_repository.dart';
import 'package:mahalli/features/onboarding/presentation/cubit/shop_cubit.dart';

typedef _ExpenseData = (List<ExpenseModel>, List<ExpenseCategoryModel>);

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});
  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  late DateTime _month = DateTime(DateTime.now().year, DateTime.now().month);
  late Future<_ExpenseData> _data = _load();

  Future<_ExpenseData> _load() async {
    final from = DateTime(_month.year, _month.month);
    final to = DateTime(
      _month.year,
      _month.month + 1,
    ).subtract(const Duration(microseconds: 1));
    final repo = sl<ExpenseRepository>();
    final results = await Future.wait<dynamic>([
      repo.list(from, to),
      repo.categories(includeInactive: true),
    ]);
    return (
      results[0] as List<ExpenseModel>,
      results[1] as List<ExpenseCategoryModel>,
    );
  }

  void _reload() => setState(() {
    _data = _load();
  });

  void _changeMonth(int delta) {
    setState(() {
      _month = DateTime(_month.year, _month.month + delta);
      _data = _load();
    });
  }

  Future<void> _openForm([ExpenseModel? entry]) async {
    final changed = await Navigator.of(context).pushNamed<bool>(
      AppRoutes.expenseForm,
      arguments: ExpenseFormArgs(
        entry: entry,
        onSaved: (saved) =>
            _month = DateTime(saved.date.year, saved.date.month),
      ),
    );
    if (changed == true && mounted) _reload();
  }

  Future<void> _openCategories() async {
    await Navigator.of(context).pushNamed<void>(AppRoutes.expenseCategories);
    if (mounted) _reload();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final locale = Localizations.localeOf(context).languageCode;
    final side = ((MediaQuery.sizeOf(context).width - 640) / 2).clamp(
      0.0,
      double.infinity,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(l.expenses),
        actions: [
          IconButton(
            tooltip: l.expenseCategories,
            onPressed: _openCategories,
            icon: const Icon(Icons.category_outlined),
          ),
          IconButton(
            tooltip: l.addExpense,
            onPressed: _openForm,
            icon: const Icon(Icons.add_circle_outline),
          ),
        ],
      ),
      body: FutureBuilder<_ExpenseData>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorView(message: l.genericError, onRetry: _reload);
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final entries = snapshot.data!.$1.toList()
            ..sort((a, b) => b.date.compareTo(a.date));
          final names = {
            for (final category in snapshot.data!.$2)
              category.id: category.name,
          };
          final total = entries.fold<int>(0, (sum, e) => sum + e.amountMinor);
          final now = DateTime.now();
          final currentMonth =
              now.year == _month.year && now.month == _month.month;
          final today = currentMonth
              ? entries
                    .where(
                      (e) =>
                          e.date.year == now.year &&
                          e.date.month == now.month &&
                          e.date.day == now.day,
                    )
                    .fold<int>(0, (sum, e) => sum + e.amountMinor)
              : 0;
          return RefreshIndicator(
            onRefresh: () async {
              _reload();
              await _data;
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(side + 16, 8, side + 16, 28),
              children: [
                Row(
                  children: [
                    IconButton(
                      tooltip: l.month,
                      onPressed: () => _changeMonth(-1),
                      icon: Icon(
                        Directionality.of(context) == TextDirection.rtl
                            ? Icons.chevron_right
                            : Icons.chevron_left,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        DateFormat.yMMMM(locale).format(_month),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),
                    IconButton(
                      tooltip: l.month,
                      onPressed: () => _changeMonth(1),
                      icon: Icon(
                        Directionality.of(context) == TextDirection.rtl
                            ? Icons.chevron_left
                            : Icons.chevron_right,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D1C19),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l.expenses,
                        style: const TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        context.money(Money(total)),
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      if (currentMonth) ...[
                        const SizedBox(height: 8),
                        Text(
                          '${l.todayExpenses}: ${context.money(Money(today))}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                FilledButton.icon(
                  onPressed: _openForm,
                  icon: const Icon(Icons.add),
                  label: Text(l.addExpense),
                ),
                const SizedBox(height: 18),
                Text(
                  l.recentExpenses,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                if (entries.isEmpty)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Icon(
                            Icons.receipt_long_outlined,
                            size: 34,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(height: 8),
                          Text(l.expenseNoEntries, textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                ...entries.map((entry) {
                  final category = names[entry.categoryId] ?? l.expenseCategory;
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.primaryContainer,
                        child: Icon(
                          Icons.receipt_long_outlined,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      title: Text(
                        entry.description?.trim().isNotEmpty == true
                            ? entry.description!
                            : category,
                      ),
                      subtitle: Text(
                        '$category • ${DateFormat.yMd(locale).format(entry.date)}',
                      ),
                      trailing: Text(
                        context.money(Money(entry.amountMinor)),
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                      onTap: () => _openForm(entry),
                    ),
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ExpenseFormPage extends StatefulWidget {
  const ExpenseFormPage({super.key, this.entry, this.onSaved});
  final ExpenseModel? entry;
  final ValueChanged<ExpenseModel>? onSaved;
  @override
  State<ExpenseFormPage> createState() => _ExpenseFormPageState();
}

class _ExpenseFormPageState extends State<ExpenseFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _amount = TextEditingController();
  late final _description = TextEditingController(
    text: widget.entry?.description,
  );
  late DateTime _date = widget.entry?.date ?? DateTime.now();
  List<ExpenseCategoryModel> _categories = const [];
  int? _category;
  bool _loadingCategories = true;
  bool _saving = false;
  String? _categoryError;
  String? _saveError;
  bool _initializedAmount = false;

  @override
  void initState() {
    super.initState();
    _category = widget.entry?.categoryId;
    _loadCategories();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initializedAmount) {
      final code = context.read<ShopCubit>().state.shop?.currency ?? 'ILS';
      if (widget.entry != null) {
        _amount.text = Money(widget.entry!.amountMinor).format(currency: code);
      }
      _initializedAmount = true;
    }
  }

  Future<void> _loadCategories() async {
    setState(() {
      _loadingCategories = true;
      _categoryError = null;
    });
    try {
      final rows = await sl<ExpenseRepository>().categories(
        includeInactive: true,
      );
      if (!mounted) return;
      setState(() {
        _categories = rows.where((r) => r.active || r.id == _category).toList();
        _loadingCategories = false;
      });
    } catch (_) {
      if (mounted) {
        setState(() {
          _loadingCategories = false;
          _categoryError = context.l10n.genericError;
        });
      }
    }
  }

  Future<void> _addCategory() async {
    final saved = await showExpenseCategoryEditor(context);
    if (saved == null || !mounted) return;
    _category = saved.id;
    await _loadCategories();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _date.isAfter(now) ? now : _date,
      firstDate: DateTime(2000),
      lastDate: now,
    );
    if (picked != null && mounted) {
      setState(
        () => _date = DateTime(
          picked.year,
          picked.month,
          picked.day,
          now.hour,
          now.minute,
          now.second,
        ),
      );
    }
  }

  @override
  void dispose() {
    _amount.dispose();
    _description.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_saving || !_formKey.currentState!.validate()) return;
    final l = context.l10n;
    final code = context.read<ShopCubit>().state.shop?.currency ?? 'ILS';
    final amount = Money.tryParse(_amount.text, currency: code)!.minor;
    setState(() {
      _saving = true;
      _saveError = null;
    });
    try {
      final saved = await sl<ExpenseRepository>().save(
        ExpenseModel(
          id: widget.entry?.id ?? 0,
          categoryId: _category!,
          amountMinor: amount,
          date: _date,
          description: _description.text.trim().isEmpty
              ? null
              : _description.text.trim(),
        ),
      );
      if (!mounted) return;
      widget.onSaved?.call(saved);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.entry == null ? l.expenseSaved : l.expenseUpdated,
          ),
        ),
      );
      Navigator.of(context).pop(true);
    } catch (error) {
      if (mounted) {
        setState(() {
          _saveError = error is Failure ? l.failureText(error) : l.saveFailed;
        });
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final code = context.read<ShopCubit>().state.shop?.currency ?? 'ILS';
    final locale = Localizations.localeOf(context).languageCode;
    final side = ((MediaQuery.sizeOf(context).width - 640) / 2).clamp(
      0.0,
      double.infinity,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.entry == null ? l.addExpense : l.editExpense),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.fromLTRB(side + 16, 8, side + 16, 28),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.entry == null ? l.addExpense : l.editExpense,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 18),
                    if (_loadingCategories)
                      const Padding(
                        padding: EdgeInsets.all(12),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    else if (_categoryError != null)
                      Row(
                        children: [
                          Expanded(child: Text(_categoryError!)),
                          TextButton(
                            onPressed: _loadCategories,
                            child: Text(l.retry),
                          ),
                        ],
                      )
                    else ...[
                      DropdownButtonFormField<int>(
                        key: ValueKey('${_category}_${_categories.length}'),
                        initialValue: _categories.any((c) => c.id == _category)
                            ? _category
                            : null,
                        isExpanded: true,
                        items: _categories
                            .map(
                              (item) => DropdownMenuItem(
                                value: item.id,
                                child: Text(item.name),
                              ),
                            )
                            .toList(),
                        onChanged: _saving || _categories.isEmpty
                            ? null
                            : (value) => setState(() => _category = value),
                        validator: (value) =>
                            value == null ? l.expenseSelectCategory : null,
                        decoration: InputDecoration(
                          labelText: l.expenseCategory,
                        ),
                      ),
                      if (_categories.isEmpty) ...[
                        const SizedBox(height: 8),
                        Text(
                          l.expenseCategoryHint,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: TextButton.icon(
                          onPressed: _saving ? null : _addCategory,
                          icon: const Icon(Icons.add),
                          label: Text(l.addExpenseCategory),
                        ),
                      ),
                    ],
                    const SizedBox(height: 8),
                    TextFormField(
                      key: const Key('expense_amount'),
                      controller: _amount,
                      enabled: !_saving,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: InputDecoration(
                        labelText: l.expenseAmount,
                        prefixText:
                            '${context.money(Money.zero).split(' ').first} ',
                      ),
                      validator: (value) {
                        final parsed = Money.tryParse(value, currency: code);
                        if (parsed == null) return l.invalidNumber;
                        if (parsed.minor <= 0) return l.expensePositiveAmount;
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _description,
                      enabled: !_saving,
                      maxLength: 200,
                      decoration: InputDecoration(
                        labelText: '${l.expenseDescription} (${l.optional})',
                      ),
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton.icon(
                      onPressed: _saving ? null : _pickDate,
                      icon: const Icon(Icons.calendar_today_outlined),
                      label: Text(
                        '${l.expenseDate}: ${DateFormat.yMd(locale).format(_date)}',
                      ),
                    ),
                    if (_saveError != null) ...[
                      const SizedBox(height: 12),
                      Text(
                        _saveError!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed:
                          _saving ||
                              _loadingCategories ||
                              _categoryError != null
                          ? null
                          : _save,
                      child: _saving
                          ? const SizedBox.square(
                              dimension: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(l.save),
                    ),
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

class ExpenseCategoriesPage extends StatefulWidget {
  const ExpenseCategoriesPage({super.key});
  @override
  State<ExpenseCategoriesPage> createState() => _ExpenseCategoriesPageState();
}

class _ExpenseCategoriesPageState extends State<ExpenseCategoriesPage> {
  late Future<List<ExpenseCategoryModel>> _categories = _load();
  Future<List<ExpenseCategoryModel>> _load() =>
      sl<ExpenseRepository>().categories(includeInactive: true);
  void _reload() => setState(() {
    _categories = _load();
  });
  Future<void> _edit([ExpenseCategoryModel? category]) async {
    final saved = await showExpenseCategoryEditor(context, category: category);
    if (saved != null && mounted) _reload();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l.expenseCategories)),
      body: FutureBuilder<List<ExpenseCategoryModel>>(
        future: _categories,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorView(message: l.genericError, onRetry: _reload);
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final rows = snapshot.data!;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              FilledButton.icon(
                onPressed: _edit,
                icon: const Icon(Icons.add),
                label: Text(l.addExpenseCategory),
              ),
              const SizedBox(height: 14),
              if (rows.isEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Icon(
                          Icons.category_outlined,
                          size: 36,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(height: 8),
                        Text(l.expenseCategoryEmpty),
                        Text(
                          l.expenseCategoryHint,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ...rows.map(
                (category) => Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.primaryContainer,
                      child: Icon(
                        Icons.category_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    title: Text(category.name),
                    subtitle: category.active ? null : Text(l.inactive),
                    trailing: const Icon(Icons.edit_outlined),
                    onTap: () => _edit(category),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

Future<ExpenseCategoryModel?> showExpenseCategoryEditor(
  BuildContext context, {
  ExpenseCategoryModel? category,
}) => showDialog<ExpenseCategoryModel>(
  context: context,
  builder: (_) => _ExpenseCategoryDialog(category: category),
);

class _ExpenseCategoryDialog extends StatefulWidget {
  const _ExpenseCategoryDialog({this.category});
  final ExpenseCategoryModel? category;
  @override
  State<_ExpenseCategoryDialog> createState() => _ExpenseCategoryDialogState();
}

class _ExpenseCategoryDialogState extends State<_ExpenseCategoryDialog> {
  final _form = GlobalKey<FormState>();
  late final _name = TextEditingController(text: widget.category?.name);
  bool _busy = false;
  String? _error;
  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_busy) return;
    if (!_form.currentState!.validate()) return;
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final saved = await sl<ExpenseRepository>().saveCategory(
        _name.text,
        id: widget.category?.id,
      );
      if (mounted) Navigator.of(context).pop(saved);
    } catch (error) {
      if (mounted) {
        setState(() {
          _error = error is Failure
              ? context.l10n.failureText(error)
              : context.l10n.saveFailed;
        });
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return AlertDialog(
      title: Text(
        widget.category == null ? l.addExpenseCategory : l.editExpenseCategory,
      ),
      content: Form(
        key: _form,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              key: const Key('expense_category_name'),
              controller: _name,
              autofocus: true,
              maxLength: 60,
              decoration: InputDecoration(labelText: l.expenseCategoryName),
              validator: (value) => value == null || value.trim().isEmpty
                  ? l.requiredField
                  : null,
              onFieldSubmitted: (_) => _save(),
            ),
            if (_error != null)
              Text(
                _error!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _busy ? null : () => Navigator.of(context).pop(),
          child: Text(l.cancel),
        ),
        FilledButton(onPressed: _busy ? null : _save, child: Text(l.save)),
      ],
    );
  }
}
