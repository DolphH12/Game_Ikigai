import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../main.dart';

class Star extends SpriteComponent
    with HasGameRef<GameWorld>, CollisionCallbacks {
  Star({super.position});
  @override
  Future<void> onLoad() async {
    size = Vector2(32, 32);

    sprite = Sprite(await game.images.load('star.png'));

    final shapeHitbox = RectangleHitbox();

    add(shapeHitbox);

    return super.onLoad();
  }
}
