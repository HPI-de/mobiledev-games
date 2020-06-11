import 'package:flutter/material.dart';

import 'game.dart';

Future<void> main() async {
  await TowerDefenseGame.init();
  runApp(game.widget);
}
