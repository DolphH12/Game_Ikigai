import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:game_ikigai/obstacles/info.dart';
import 'package:game_ikigai/obstacles/star.dart';
import 'package:game_ikigai/players/player.dart';

import '../obstacles/collision_block.dart';

class Level extends World {
  final String levelName;
  final Player player;
  final Map<String, dynamic> data;

  Level({required this.levelName, required this.player, required this.data});

  late TiledComponent level;
  List<CollisionBlock> collisionBlocks = [];

  @override
  Future<void> onLoad() async {
    level = await TiledComponent.load('$levelName.tmx', Vector2.all(16));

    add(level);

    _spawningObjects();
    _collisionsObjects();

    return super.onLoad();
  }

  void _spawningObjects() {
    final spawnPoinstLayer = level.tileMap.getLayer<ObjectGroup>('Spawnpoints');

    for (final spawnPoint in spawnPoinstLayer!.objects) {
      switch (spawnPoint.class_) {
        case 'Info':
          final info = Info(
            position: Vector2(spawnPoint.x, spawnPoint.y),
            infoData: data['Info'],
          );
          add(info);
          break;
        case 'Logro1':
          final logro = Star(
            position: Vector2(spawnPoint.x, spawnPoint.y),
            logroData: data['logro_1'],
          );
          add(logro);
          break;
        case 'Logro2':
          final logro = Star(
            position: Vector2(spawnPoint.x, spawnPoint.y),
            logroData: data['logro_2'],
          );
          add(logro);
          break;
        case 'Logro3':
          final logro = Star(
            position: Vector2(spawnPoint.x, spawnPoint.y),
            logroData: data['logro_3'],
          );
          add(logro);
          break;
        case 'Logro4':
          final logro = Star(
            position: Vector2(spawnPoint.x, spawnPoint.y),
            logroData: data['logro_4'],
          );
          add(logro);
          break;
        case 'Player':
          player.position =
              Vector2(spawnPoint.x, spawnPoint.y) - Vector2(40, 40);
          add(player);
          break;
        default:
          break;
      }
    }
  }

  void _collisionsObjects() {
    final spawnPoinstLayer = level.tileMap.getLayer<ObjectGroup>('Collisions');

    for (final collision in spawnPoinstLayer!.objects) {
      final block = CollisionBlock(
        position: Vector2(collision.x, collision.y),
        size: Vector2(collision.width, collision.height),
      );
      collisionBlocks.add(block);
      add(block);
    }
    player.collissionsBlock = collisionBlocks;
  }
}
