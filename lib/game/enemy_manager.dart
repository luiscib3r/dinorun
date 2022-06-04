import 'dart:math';

import 'package:dinorun/characters/characters.dart';
import 'package:dinorun/game/game.dart';
import 'package:flame/components.dart';

class EnemyManager extends Component with HasGameRef<DinoGame> {
  final _random = Random();
  late Timer _timer = Timer(4, repeat: true, onTick: spawnRandomEnemy);

  int _spawnLevel = 0;

  void spawnRandomEnemy() {
    final index = _random.nextInt(EnemyType.values.length);
    final enemyType = EnemyType.values[index];

    final enemy = Enemy(enemyType);

    gameRef.add(enemy);
  }

  @override
  void onMount() {
    super.onMount();
    _timer.start();
  }

  @override
  void update(double dt) {
    _timer.update(dt);

    final newSpawnLevel = gameRef.score ~/ 500;

    if (_spawnLevel < newSpawnLevel) {
      _spawnLevel = newSpawnLevel;

      final newWaitTime = 4 / (1 + 0.1 * _spawnLevel);

      _timer.stop();

      _timer = Timer(newWaitTime, repeat: true, onTick: spawnRandomEnemy);

      _timer.start();
    }
  }
}
