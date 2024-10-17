import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:game_ikigai/utils/rounded_button.dart';

import '../main.dart';

class Info extends SpriteComponent
    with HasGameRef<GameWorld>, CollisionCallbacks {
  final Map<String, dynamic> infoData;
  Info({super.position, required this.infoData});
  @override
  Future<void> onLoad() async {
    size = Vector2(32, 32);

    sprite = Sprite(await game.images.load('info.png'));

    final shapeHitbox = RectangleHitbox();

    add(shapeHitbox);

    return super.onLoad();
  }

  void showCollisionDialog() {
    final context = gameRef.buildContext!;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(10),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 100),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 72, 228, 252),
                    Color.fromARGB(255, 201, 246, 250)
                  ]),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    infoData['title'],
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PixelifySans',
                      color: Color.fromARGB(255, 255, 255, 255),
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 0, 0, 0),
                          offset: Offset(2, 2),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (infoData['subtitle_1'] != null)
                    Text(
                      infoData['subtitle_1'] ?? '',
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PixelifySans',
                        color: Color.fromARGB(255, 250, 46, 46),
                        shadows: [
                          Shadow(
                            color: Color.fromARGB(255, 255, 255, 255),
                            offset: Offset(4, 4),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  const SizedBox(height: 20),
                  if (infoData['contenido_1'] != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        infoData['contenido_1'],
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  if (infoData['subtitle_2'] != null)
                    Text(
                      infoData['subtitle_2'] ?? '',
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PixelifySans',
                        color: Color.fromARGB(255, 250, 46, 46),
                        shadows: [
                          Shadow(
                            color: Color.fromARGB(255, 255, 255, 255),
                            offset: Offset(4, 4),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  const SizedBox(height: 20),
                  if (infoData['contenido_2'] != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        infoData['contenido_2'] ?? '',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  if (infoData['subtitle_3'] != null)
                    Text(
                      infoData['subtitle_3'] ?? '',
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PixelifySans',
                        color: Color.fromARGB(255, 250, 46, 46),
                        shadows: [
                          Shadow(
                            color: Color.fromARGB(255, 255, 255, 255),
                            offset: Offset(4, 4),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  const SizedBox(height: 20),
                  if (infoData['contenido_3'] != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        infoData['contenido_3'] ?? '',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  const SizedBox(height: 40),
                  RoundedButton(
                    text: infoData['label_btn'],
                    onPressed: () {
                      Navigator.of(context).pop();
                      gameRef.resumeEngine();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
