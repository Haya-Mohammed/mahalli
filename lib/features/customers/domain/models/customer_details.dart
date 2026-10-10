class CustomerDetails {
  const CustomerDetails({
    required this.id,
    required this.name,
    required this.isActive,
    required this.balanceMinor,
    this.phone,
    this.notes,
  });
  final int id;
  final String name;
  final String? phone;
  final String? notes;
  final bool isActive;
  final int balanceMinor;
}
