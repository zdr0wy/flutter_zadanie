import 'package:flutter/material.dart';
import 'package:rekrutacja_flutter/models/repair.dart';
import 'package:rekrutacja_flutter/widgets/repair_item.dart';

class RepairsScreen extends StatelessWidget {
  const RepairsScreen({super.key, required this.repairs});

  final List<Repair> repairs;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: repairs.length,
      separatorBuilder: (ctx, index) => const SizedBox(height: 15),
      itemBuilder: (ctx, index) => RepairItem(
        repair: repairs[index],
      ),
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
    );
  }
}
