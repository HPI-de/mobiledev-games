import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:meta/meta.dart';

TowerDefenseGame get game => _game;
TowerDefenseGame _game;

class TowerDefenseGame extends BaseGame {
  TowerDefenseGame._({
    @required this.tilesheet,
  }) : assert(tilesheet != null);

  static Future<void> init() async {
    if (game != null) {
      return;
    }

    final tilesheet = await Flame.images.load('tilesheet.png');
    _game = TowerDefenseGame._(tilesheet: tilesheet);
  }

  final Image tilesheet;
}
