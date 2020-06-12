import 'dart:ui';

import 'package:colorz/colorz.dart';
import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';

import 'blocks.dart';

class Paddle extends PositionComponent {
  static const theWidth = 100.0;
  static const theHeight = 20.0;

  Paddle({
    @required double x,
    @required double y,
  }) {
    this.x = x;
    this.y = y;
    this.width = theWidth;
    this.height = theHeight;
  }

  @override
  void render(Canvas c) {
    c.drawRect(
      Rect.fromLTWH(x, y, width, height),
      Paint()
        ..color = Colorz.lightBlueberryPearl
        ..style = PaintingStyle.fill,
    );
  }
}
