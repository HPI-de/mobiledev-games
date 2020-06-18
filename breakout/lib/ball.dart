import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';

import 'blocks.dart';
import 'paddle.dart';

class Ball extends PositionComponent {
  Ball({
    @required Offset position,
    @required double size,
    @required this.speed,
    @required this.blocks,
    @required this.paddle,
  })  : assert(position != null),
        assert(size != null),
        assert(speed != null),
        assert(blocks != null),
        assert(paddle != null) {
    this.x = position.dx;
    this.y = position.dy;
    this.width = size;
    this.height = size;
  }

  Offset speed;

  final BlockManager blocks;
  final Paddle paddle;
  Size environmentSize;

  @override
  void resize(Size size) => environmentSize = size;

  @override
  void render(Canvas c) {
    c.drawRect(
      Rect.fromLTWH(x, y, width, height),
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    // In the first update call, we don't have an environment size yet.
    if (environmentSize == null) return;

    final currentPosition = Offset(x, y);
    final delta = speed * dt;
    final estimatedPos = currentPosition + delta;

    if (estimatedPos.dx < 0 ||
        estimatedPos.dx + width > environmentSize.width) {
      speed = speed.scale(-1, 1);
    }
    if (estimatedPos.dy < 0 ||
        estimatedPos.dy + height > environmentSize.height) {
      speed = speed.scale(1, -1);
    }

    final position = currentPosition + speed * dt;
    x = position.dx;
    y = position.dy;
  }
}
