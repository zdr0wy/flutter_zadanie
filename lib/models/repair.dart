import 'package:rekrutacja_flutter/models/base_model.dart';

enum RepairStatus { pending, inProgress, completed, failed, cancelled }

class Repair extends BaseModel {
  const Repair({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.transformerId,
    required this.status,
    required this.description,
    this.expectedCompleteDate,
    this.completedAt,
  });

  final int transformerId;
  final RepairStatus status;
  final String description;
  final DateTime? expectedCompleteDate;
  final DateTime? completedAt;
}
