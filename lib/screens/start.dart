import 'package:flutter/material.dart';
import 'package:rekrutacja_flutter/common/images_url.dart';
import 'package:rekrutacja_flutter/data/instructions.dart';
import 'package:rekrutacja_flutter/widgets/start_text_item.dart';
import 'package:rekrutacja_flutter/widgets/typography.dart';
import 'package:transparent_image/transparent_image.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  final Widget divider = const SizedBox(
    height: 20,
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Here\'s the task',
            textAlign: TextAlign.center,
            style: CustomStyle.h1,
          ),
          divider,
          FadeInImage(
            height: 250,
            fit: BoxFit.cover,
            placeholder: MemoryImage(kTransparentImage),
            image: const NetworkImage(heroImageUrl),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                divider,
                for (final instruction in instructions) ...[
                  StartTextItem(item: instruction),
                  divider
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}
