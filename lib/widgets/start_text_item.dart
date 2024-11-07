import 'package:flutter/material.dart';
import 'package:rekrutacja_flutter/data/instructions.dart';
import 'package:rekrutacja_flutter/widgets/typography.dart';

class StartTextItem extends StatelessWidget {
  const StartTextItem({super.key, required this.item});

  final InstructionData item;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = CustomStyle.getStyle(item.type);

    return Text(item.text, style: textStyle);
  }
}
