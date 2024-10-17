import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:game_ikigai/data/data.dart';
import 'package:game_ikigai/levels/level.dart';

import 'loader/loader.dart';
import 'players/player.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GAME IKIGAI',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GameWidget(
          game: GameWorld(),
        ),
      ),
    );
  }
}

class GameWorld extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  CameraComponent? cam;
  Player player = Player();
  List<String> levelNames = [
    'Level-01',
    'Level-02',
    'Level-03',
    'Level-04',
    'Level-05',
    'Level-Final'
  ];
  int currentLevelIndex = 0;

  @override
  Color backgroundColor() => const Color.fromARGB(255, 1, 213, 255);

  @override
  FutureOr<void> onLoad() {
    _loadLevel();

    return super.onLoad();
  }

  void loadNextLevel() {
    final loader = LoaderComponent();
    world.add(loader);
    removeWhere((component) => component is Level);

    if (currentLevelIndex < levelNames.length - 1) {
      currentLevelIndex++;
      _loadLevel();
      loader.removeLoader();
    } else {
      print('Game Over');
    }
  }

  void _loadLevel() {
    Future.delayed(const Duration(seconds: 1), () {
      Level worldLevel = Level(
        levelName: levelNames[currentLevelIndex],
        player: player,
        data: data['mundo_${currentLevelIndex + 1}'] ?? {},
      );

      if (cam != null) {
        cam!.removeFromParent();
      }

      cam = CameraComponent.withFixedResolution(
        world: worldLevel,
        width: 640,
        height: 368,
      );
      cam!.viewfinder.anchor = Anchor.topLeft;
      addAll([cam!, worldLevel]);
    });
  }
}
