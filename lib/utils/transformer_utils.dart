import 'package:flutter/material.dart';
import 'package:rekrutacja_flutter/models/transformer.dart';

Color transformerTypeToColor(TransformerType type) {
  switch (type) {
    case TransformerType.fighter:
      return Colors.red;
    case TransformerType.medic:
      return const Color.fromARGB(255, 21, 114, 24);
    case TransformerType.spy:
      return const Color.fromARGB(255, 100, 94, 94);
    case TransformerType.mechanic:
      return const Color.fromARGB(255, 16, 88, 147);
  }
}
