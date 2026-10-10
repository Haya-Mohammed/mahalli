class ExpenseModel {
  const ExpenseModel({
    required this.id,
    required this.categoryId,
    required this.amountMinor,
    required this.date,
    this.description,
  });
  final int id;
  final int categoryId;
  final int amountMinor;
  final DateTime date;
  final String? description;
}
