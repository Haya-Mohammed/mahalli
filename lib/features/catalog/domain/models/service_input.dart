class ServiceInput {
  const ServiceInput({
    required this.name,
    required this.sellingPrice,
    required this.cost,
    this.categoryId,
  });
  final String name;
  final int sellingPrice;
  final int cost;
  final int? categoryId;
}
