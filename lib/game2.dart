import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flame/game.dart';

class Game2 extends FlameGame {

  var _x = 0.0;
  var _y = 0.0;

  @override
  void update(double dt) {
    super.update(dt);

    _x += 0.05;
    _y += 0.05;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(Rect.fromLTWH(150 + cos(_x) * 20, 300 + sin(_y) * 20, 100, 100), Paint()..color = const Color(
        0xFFFF0000));
  }

}