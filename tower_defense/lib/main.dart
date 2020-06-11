import 'package:flutter/material.dart';

import 'game.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await TowerDefenseGame.init();
  runApp(game.widget);
}
