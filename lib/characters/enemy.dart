import 'dart:math';

import 'package:dinorun/characters/characters.dart';
import 'package:dinorun/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

class Enemy extends SpriteAnimationComponent with HasGameRef<DinoGame> {
  Enemy(this.type) : super(anchor: Anchor.center);

  final EnemyType type;

  final _random = Random();

  @override
  Future<void>? onLoad() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load(type.assetName),
      srcSize: Vector2(type.width, type.height),
    );

    animation = spriteSheet.createAnimation(
      row: 0,
      stepTime: 0.1,
    );
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    final r = type.width / type.height;

    this.size = Vector2(r * size.y * 0.12, size.y * 0.12);

    if (position == Vector2.zero()) {
      position = Vector2(size.x + this.size.x, size.y * 0.82);
    }

    if (type.canFly && _random.nextBool()) {
      position.y -= this.size.y * 0.8;
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.x -= type.speed * dt;

    if (position.x < -size.x) {
      shouldRemove = true;
    }
  }
}
