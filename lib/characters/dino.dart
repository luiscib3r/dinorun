import 'package:dinorun/game/dino_game.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

class Dino extends SpriteAnimationComponent with HasGameRef<DinoGame> {
  Dino() : super(anchor: Anchor.center);

  late final SpriteAnimation _idleAnimation;
  late final SpriteAnimation _runAnimation;
  late final SpriteAnimation _hitAnimation;

  final lives = ValueNotifier(5);

  double speedY = 0;
  double yMax = 0;

  bool _isHit = false;

  @override
  Future<void>? onLoad() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('dinosprite.png'),
      srcSize: Vector2.all(24),
    );

    _idleAnimation = spriteSheet.createAnimation(
      row: 0,
      stepTime: 0.15,
      to: 3,
    );

    _runAnimation = spriteSheet.createAnimation(
      row: 0,
      stepTime: 0.15,
      from: 4,
      to: 10,
    );

    _hitAnimation = spriteSheet.createAnimation(
      row: 0,
      stepTime: 0.15,
      from: 14,
      to: 16,
    );

    animation = _runAnimation;
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    this.size = Vector2.all(size.y * 0.15);

    position = Vector2(width + width * 0.8, size.y * 0.82);

    yMax = position.y;
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += speedY * dt;

    if (isOnGround) {
      position.y = yMax;
      speedY = 0;
    } else {
      speedY += DinoGame.gravity * dt;
    }
  }

  bool get isOnGround => position.y >= yMax;

  void run() {
    _isHit = false;
    animation = _runAnimation;
  }

  void idle() {
    animation = _idleAnimation;
  }

  void hit() {
    if (!_isHit) {
      if (lives.value > 0) lives.value--;
      animation = _hitAnimation;
      _isHit = true;

      Future.delayed(const Duration(seconds: 1), run);
    }
  }

  void jump() {
    if (isOnGround) {
      speedY = -650;
    }
  }
}
