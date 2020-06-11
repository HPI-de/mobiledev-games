import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

import 'game.dart';

const tileDimension = 128.0;
const tileSize = Size.square(tileDimension);

extension FancySprite on Sprite {
  static Sprite fromTilesheet(int x, int y) => FancySprite.fromImage(
        game.tilesheet,
        offset: Offset(x.toDouble(), y.toDouble()) * tileDimension,
        size: tileSize,
      );

  static Sprite fromImage(
    Image image, {
    Offset offset = Offset.zero,
    Size size,
  }) {
    return Sprite.fromImage(
      image,
      x: offset.dx,
      y: offset.dy,
      width: size?.width,
      height: size?.height,
    );
  }
}

extension FancySpriteComponent on SpriteComponent {
  static SpriteComponent fromSprite(Size size, Sprite sprite) =>
      SpriteComponent.fromSprite(size.width, size.height, sprite);
}
