enum TransformerType { medic, mechanic, fighter, spy }

class Transformer {
  const Transformer({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.type,
  });

  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final TransformerType type;
}
