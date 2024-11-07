import 'package:flutter/material.dart';
import 'package:rekrutacja_flutter/data/repairs_data.dart';
import 'package:rekrutacja_flutter/data/transformers_data.dart';
import 'package:rekrutacja_flutter/screens/repairs.dart';
import 'package:rekrutacja_flutter/screens/start.dart';
import 'package:rekrutacja_flutter/screens/transformers.dart';

class ScreenCollectionItem {
  const ScreenCollectionItem({required this.title, required this.screen});

  final String title;
  final Widget screen;
}

final List<ScreenCollectionItem> screenCollection = [
  const ScreenCollectionItem(
    title: 'Instrukcje',
    screen: StartScreen(),
  ),
  ScreenCollectionItem(
    title: 'Transformers',
    screen: TransformersScreen(
      transformers: dummyTransformers,
    ),
  ),
  ScreenCollectionItem(
    title: 'Repairs',
    screen: RepairsScreen(repairs: dummyRepairs),
  )
];
