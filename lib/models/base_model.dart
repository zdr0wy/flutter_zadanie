class BaseModel {
  const BaseModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
}
