class LocationItem {
  final int id;
  final String name;

  const LocationItem({required this.id, required this.name});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LocationItem && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
