import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:meta/meta.dart';

import 'components/towers.dart';

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

    _game = TowerDefenseGame._(
      tilesheet: await Flame.images.load('tilesheet.png'),
    );
    // _onCreate() creates components that rely on the global singleton instance.
    // ignore: cascade_invocations
    _game._onCreate();
  }

  void _onCreate() {
    final tower = CannonTower();
    add(tower.component);
  }

  final Image tilesheet;
}
