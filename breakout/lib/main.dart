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
  Game game = BreakoutGame();
  runApp(Container(
    color: Colorz.redZero,
    alignment: Alignment.center,
    child: SizedBox(
      width: 500,
      height: 500,
      child: game.widget,
    ),
  ));
}

class BreakoutGame extends BaseGame with HorizontalDragDetector {
  BreakoutGame() {
    final blocks = BlockManager.fillArea(Rect.fromLTWH(0, 0, 500, 200));
    final paddle = Paddle(x: 10, y: 500 - Paddle.theHeight);
    final ball = Ball(
      x: 350,
      y: 300,
      speedX: 10,
      speedY: 10,
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
