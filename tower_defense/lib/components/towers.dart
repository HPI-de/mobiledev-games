import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:meta/meta.dart';

import '../utils.dart';

@immutable
abstract class Tower {
  Tower({
    @required Sprite sprite,
    Size size = const Size.square(48),
  })  : assert(sprite != null),
        assert(size != null),
        component = FancySpriteComponent.fromSprite(size, sprite);

  final SpriteComponent component;
}

class CannonTower extends Tower {
  CannonTower() : super(sprite: FancySprite.fromTilesheet(19, 10));
}
