import 'package:flutter/material.dart';
import 'package:rekrutacja_flutter/models/repair.dart';

class RepairItem extends StatelessWidget {
  const RepairItem({super.key, required this.repair});

  final Repair repair;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Text(repair.description),
          ],
        ));
  }
}
