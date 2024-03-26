import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:poc/plock_components/PlockComponent.dart';
import 'package:poc/plock_components/RectanglePlockComponent.dart';

class ObjectComponent extends PositionComponent with TapCallbacks, DragCallbacks {
  final selectObject;
  final isObjectSelected;

  late RectangleComponent rectangle;
  late RectangleComponent rectangleSelect;

  String name = 'Object';
   List<PlockComponent> plockComponents = [
     RectanglePlockComponent(),
   ];

  ObjectComponent(this.selectObject, this.isObjectSelected);

  void removeComponent(PlockComponent component) {
    plockComponents.remove(component);
  }

  void addComponent(PlockComponent component) {
    plockComponents.add(component);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    size = Vector2(50, 50);
    position = Vector2(100, 100);

    rectangle = RectangleComponent(
      size: Vector2(50, 50),
      position: Vector2(0, 0),
    );

    rectangleSelect = RectangleComponent(
      size: Vector2(50, 50),
      position: Vector2(0, 0),
      paint: Paint()
        ..color = const Color(0x00F5D142)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
    );

    add(rectangle);
    rectangle.add(rectangleSelect);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    if (isObjectSelected(this)) {
      rectangleSelect.paint = Paint()
        ..color = const Color(0xFFF5D142)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
    } else {
      rectangleSelect.paint = Paint()
        ..color = const Color(0x00F5D142)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  bool onTapUp(TapUpEvent info) {
    if (isObjectSelected(this)) {
      selectObject(null);
    } else {
      selectObject(this);
    }
    return true;
  }

  @override
  void onDragStart(DragStartEvent event) {
    super.onDragStart(event);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    position += event.delta;
  }

  @override
  void onDragEnd(DragEndEvent event) {
    super.onDragEnd(event);
  }

  @override
  void onDragCancel(DragCancelEvent event) {
    super.onDragCancel(event);
  }
}