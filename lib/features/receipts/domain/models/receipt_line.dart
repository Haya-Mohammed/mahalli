class ReceiptLine {
  final String name;
  final int quantityMilli;
  final int unitPriceMinor;
  final int totalMinor;

  const ReceiptLine({
    required this.name,
    required this.quantityMilli,
    required this.unitPriceMinor,
    required this.totalMinor,
  });
}
