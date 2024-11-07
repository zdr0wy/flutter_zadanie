import 'package:flutter/material.dart';
import 'package:rekrutacja_flutter/models/transformer.dart';
import 'package:rekrutacja_flutter/widgets/transformer_item.dart';

class TransformersScreen extends StatelessWidget {
  const TransformersScreen({super.key, required this.transformers});

  final List<Transformer> transformers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      itemCount: transformers.length,
      itemBuilder: (ctx, index) =>
          TransformerItem(transformer: transformers[index]),
    );
  }
}
