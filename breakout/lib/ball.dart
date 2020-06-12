import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';

import 'blocks.dart';
import 'paddle.dart';

class Ball extends PositionComponent {
  static const size = 20.0;

  Ball({
    @required double x,
    @required double y,
    @required this.speedX,
    @required this.speedY,
    @required this.blocks,
    @required this.paddle,
  }) {
    this.x = x;
    this.y = y;
    this.width = size;
    this.height = size;
  }

  double speedX, speedY;

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
    final deltaX = speedX * dt;
    final deltaY = speedY * dt;
    if (x + deltaX > environmentSize?.width ?? 400) {
      speedX *= -1;
    }
    if (y + deltaY > environmentSize?.height ?? 400) {
      speedY *= -1;
    }
    x += speedX * dt;
    y += speedY * dt;
  }
}
