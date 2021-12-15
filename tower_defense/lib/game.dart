import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:meta/meta.dart';

import 'components/level.dart';
import 'components/towers.dart';
import 'utils.dart';

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
    await _game._onCreate();
  }

  Future<void> _onCreate() async {
    final level = await Level.values.first;
    add(level.component.scaled(48 / 128));

    final tower = CannonTower();
    add(tower.component);
  }

  final Image tilesheet;

  // @override
  // void render(Canvas canvas) {
  //   canvas
  //     ..save()
  //     ..scale(48);
  //   super.render(canvas);
  //   canvas.restore();
  // }
}
