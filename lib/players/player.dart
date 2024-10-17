import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/services.dart';
import 'package:game_ikigai/main.dart';

import '../obstacles/collision_block.dart';
import '../obstacles/info.dart';
import '../obstacles/star.dart';
import '../utils/custom_hitbox.dart';
import '../utils/utils.dart';

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<GameWorld>, KeyboardHandler, CollisionCallbacks {
  Vector2 velocity = Vector2.zero();
  Vector2 movement = Vector2.zero();
  CustomHitbox hitbox = CustomHitbox(
    offsetX: 40,
    offsetY: 40,
    width: 45,
    height: 45,
  );

  List<CollisionBlock> collissionsBlock = [];

  @override
  Future<void> onLoad() async {
    priority = 3;
    await _loadAnimations();
    size = Vector2(128, 128);

    final shapeHitbox = RectangleHitbox(
      size: Vector2(hitbox.width, hitbox.height),
      position: Vector2(hitbox.offsetX, hitbox.offsetY),
    );

    add(shapeHitbox);

    return super.onLoad();
  }

  _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await game.images.load('player.png'),
      srcSize: Vector2(48, 48),
    );

    animations = {
      'idle':
          spriteSheet.createAnimation(row: 0, stepTime: 0.5, from: 0, to: 2),
      'left':
          spriteSheet.createAnimation(row: 2, stepTime: 0.1, from: 2, to: 4),
      'right':
          spriteSheet.createAnimation(row: 3, stepTime: 0.1, from: 2, to: 4),
      'up': spriteSheet.createAnimation(row: 1, stepTime: 0.1, from: 2, to: 4),
      'down':
          spriteSheet.createAnimation(row: 0, stepTime: 0.1, from: 2, to: 4),
    };

    current = 'idle';
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    movement = Vector2.zero();

    if (keysPressed.contains(LogicalKeyboardKey.keyW)) {
      movement.y += -1;
    } else if (keysPressed.contains(LogicalKeyboardKey.keyS)) {
      movement.y += 1;
    } else if (keysPressed.contains(LogicalKeyboardKey.keyA)) {
      movement.x += -1;
    } else if (keysPressed.contains(LogicalKeyboardKey.keyD)) {
      movement.x += 1;
    }
    return super.onKeyEvent(event, keysPressed);
  }

  @override
  void update(double dt) {
    _updateAnimations();
    _updateMovement(dt);
    _checkHorizontalCollisions();
    _checkVerticalCollisions();
    super.update(dt);
  }

  void _updateMovement(double dt) {
    velocity = movement * 200;
    position += velocity * dt;
  }

  void _updateAnimations() {
    if (velocity != Vector2.zero()) {
      if (velocity.x < 0) {
        current = 'left';
      } else if (velocity.x > 0) {
        current = 'right';
      } else if (velocity.y < 0) {
        current = 'up';
      } else if (velocity.y > 0) {
        current = 'down';
      }
    } else {
      current = 'idle';
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Star) {
      gameRef.pauseEngine(); // Pausar el juego
      other.showCollisionDialog();
      movement = Vector2.zero();
    }
    if (other is Info) {
      gameRef.pauseEngine(); // Pausar el juego
      other.showCollisionDialog();
      movement = Vector2.zero();
    }
  }

  void _checkHorizontalCollisions() {
    for (final block in collissionsBlock) {
      if (checkCollision(this, block)) {
        if (velocity.x > 0) {
          position.x = block.x - hitbox.offsetX - hitbox.width;
          velocity.x = 0;
          break;
        } else if (velocity.x < 0) {
          velocity.x = 0;
          position.x = block.x + block.width - hitbox.offsetX;
          break;
        }
      }
    }
  }

  void _checkVerticalCollisions() {
    for (final block in collissionsBlock) {
      if (checkCollision(this, block)) {
        if (velocity.y > 0) {
          position.y = block.y - hitbox.height - hitbox.offsetY;
        } else if (velocity.y < 0) {
          position.y = block.y + block.height - hitbox.offsetY;
        }
      }
    }
  }
}
