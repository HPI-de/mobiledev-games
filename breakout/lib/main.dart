import 'package:colorz/colorz.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:black_hole_flutter/black_hole_flutter.dart';

import 'ball.dart';
import 'blocks.dart';
import 'paddle.dart';
import 'utils.dart';

main() {
  const width = 500.0;
  const height = 900.0;

  Game game = BreakoutGame(width, height);
  runApp(Container(
    color: Colorz.redZero,
    alignment: Alignment.center,
    // We could adjust to playing field to the user's screen size, but that
    // would make scores not comparable across devices.
    child: FittedBox(
      child: SizedBox(
        width: width,
        height: height,
        child: game.widget,
      ),
    ),
  ));
}

class BreakoutGame extends BaseGame with HorizontalDragDetector {
  BreakoutGame(double width, double height) {
    final blocks = BlockManager.fillArea(
      Rect.fromLTWH(0, 0, width, height / 2),
    );
    final paddle = Paddle(x: 10, y: height - Paddle.theHeight);
    final ball = Ball(
      position: Offset(width / 2, 5 / 7 * height),
      size: 40,
      speed: Offset(500, 500),
      blocks: blocks,
      paddle: paddle,
    );
    addAll([...blocks.blocks, paddle, ball]);
  }

  @override
  void onHorizontalDragDown(DragDownDetails details) {
    print('Down');
  }

  @override
  void onHorizontalDragUpdate(DragUpdateDetails details) {
    print('Update');
  }
}
