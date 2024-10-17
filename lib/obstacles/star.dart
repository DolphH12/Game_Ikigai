import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:game_ikigai/utils/paginator_modal.dart';

import '../main.dart';

class Star extends SpriteComponent
    with HasGameRef<GameWorld>, CollisionCallbacks {
  final Map<String, dynamic> logroData;
  Star({super.position, required this.logroData});
  @override
  Future<void> onLoad() async {
    size = Vector2(32, 32);

    sprite = Sprite(await game.images.load('star.png'));

    final shapeHitbox = RectangleHitbox();

    add(shapeHitbox);

    return super.onLoad();
  }

  void showCollisionDialog() {
    final context = gameRef.buildContext!;
    showDialog(
      context: context,
      builder: (context) {
        return PaginatorModal(
          onComplete: () {
            gameRef.resumeEngine();
            if (logroData['label_btn'] != 'Pasar de Nivel') {
              removeFromParent();
            } else {
              gameRef.loadNextLevel();
            }
          },
          logroData: logroData,
        );
      },
    );
  }
}
