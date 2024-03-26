import 'package:flutter/material.dart';
import 'package:flame/game.dart';

class Game1 extends FlameGame {

  var _x = 0.0;
  var _y = 0.0;
  var _chrono = 0.0;

  @override
  void update(double dt) {
    super.update(dt);

    _chrono += dt;

    if (_chrono > 1) {
      _chrono = 0;
      _x = Vector2.random().x;
      _y = Vector2.random().y;
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(Rect.fromLTWH(50 + _x * 100, 50 + _y * 100, 100, 100), Paint()..color = const Color(0xFF00FF00));
  }

}