import 'package:flutter/material.dart';
import 'package:rekrutacja_flutter/data/instructions.dart';

abstract class CustomStyle {
  static const Color color = Colors.white;

  static const TextStyle h1 = TextStyle(
    fontSize: 35,
    color: color,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 28,
    color: color,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 26,
    color: color,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle h4 = TextStyle(
    fontSize: 22,
    color: color,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle h5 = TextStyle(
    fontSize: 20,
    color: color,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle h6 = TextStyle(
    fontSize: 16,
    color: color,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle p = TextStyle(
    fontSize: 16,
    color: color,
    fontWeight: FontWeight.normal,
  );

  static TextStyle getStyle(InstructionType type) {
    switch (type) {
      case InstructionType.h1:
        return CustomStyle.h1;
      case InstructionType.h2:
        return CustomStyle.h2;
      case InstructionType.h3:
        return CustomStyle.h3;
      case InstructionType.h4:
        return CustomStyle.h4;
      case InstructionType.h5:
        return CustomStyle.h5;
      case InstructionType.h6:
        return CustomStyle.h6;
      default:
        return CustomStyle.p;
    }
  }
}
