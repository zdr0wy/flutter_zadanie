import 'package:flutter/material.dart';
import 'package:rekrutacja_flutter/screen_map.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<StatefulWidget> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _activeIndex = 0;

  _changeTab(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenCollectionItem content = screenCollection[_activeIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(content.title),
      ),
      body: content.screen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _changeTab(index),
        currentIndex: _activeIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Start',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.android),
            label: 'Transformers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build_sharp),
            label: 'Repairs',
          )
        ],
      ),
    );
  }
}
