import 'package:flutter/material.dart';
import 'package:rekrutacja_flutter/models/transformer.dart';
import 'package:rekrutacja_flutter/utils/transformer_utils.dart';

class TransformerItem extends StatelessWidget {
  const TransformerItem({super.key, required this.transformer});

  final Transformer transformer;

  @override
  Widget build(BuildContext context) {
    final Color typeColor = transformerTypeToColor(transformer.type);

    return Container(
      height: 100,
      decoration: const BoxDecoration(color: Colors.white),
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 10,
            height: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(color: typeColor),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            transformer.name,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
