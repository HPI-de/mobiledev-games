import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:meta/meta.dart';

import 'game.dart';

extension FancyPositionComponent on PositionComponent {
  Offset get offset => Offset(x, y);
  set offset(Offset offset) {
    x = offset.dx;
    y = offset.dy;
  }
}

class GroupComponent extends PositionComponent {
  @override
  void render(Canvas c) {
    // TODO: implement render
  }
}

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

extension TransformComponent on Component {
  Component scaled(double scale) => _ScaledComponent(base: this, scale: scale);
}

class _ScaledComponent extends Component {
  _ScaledComponent({
    @required this.base,
    @required this.scale,
  })  : assert(base != null),
        assert(scale != null);

  final Component base;
  final double scale;

  @override
  void update(double t) => base.update(t);
  @override
  void render(Canvas c) {
    c
      ..save()
      ..scale(scale);
    base.render(c);
    c.restore();
  }

  @override
  void resize(Size size) => base.resize(size);
  @override
  bool loaded() => base.loaded();
  @override
  bool destroy() => base.destroy();
  @override
  bool isHud() => base.isHud();
  @override
  int priority() => base.priority();
  @override
  void onMount() => base.onMount();
  @override
  void onDestroy() => base.onDestroy();
}
