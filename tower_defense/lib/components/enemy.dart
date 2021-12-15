import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:meta/meta.dart';

import '../utils.dart';

@immutable
class Enemy {
  Enemy._({
    @required Sprite sprite,
    Size size = const Size.square(48),
  })  : assert(sprite != null),
        assert(size != null),
        component = FancySpriteComponent.fromSprite(size, sprite);

  Enemy.simple() : this._(sprite: FancySprite.fromTilesheet(15, 10));
  Enemy.fromType(String type)
      : this._(sprite: FancySprite.fromTilesheet(15 + int.parse(type), 10));

  final SpriteComponent component;
}
