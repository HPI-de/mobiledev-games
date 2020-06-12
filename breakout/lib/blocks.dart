import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flame/components/component.dart';
import 'package:black_hole_flutter/black_hole_flutter.dart';

class Block extends PositionComponent {
  static const gridSize = 50.0;

  Block({
    @required double x,
    @required double y,
    @required double width,
    @required double height,
    @required this.color,
  }) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  final Color color;

  @override
  void render(Canvas c) {
    c.drawRect(
      Rect.fromLTWH(x, y, width, height).deflate(2),
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );
  }
}

class BlockManager {
  BlockManager(this.blocks);

  BlockManager.fillArea(Rect area) : blocks = <Block>[] {
    final blockHeight = Block.gridSize;

    for (double y = area.top; y < area.bottom; y += blockHeight) {
      double blockWidth;
      for (double x = area.left; x < area.right; x += blockWidth) {
        blockWidth = Block.gridSize * (1 + (3 * Random().nextDouble()).round());
        blocks.add(Block(
          x: x,
          y: y,
          width: min(area.right - x, blockWidth),
          height: blockHeight,
          color: Random().nextColorHsv(value: 0.9, alpha: 1).toColor(),
        ));
      }
    }
  }

  final List<Block> blocks;
}
