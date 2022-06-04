import 'package:dinorun/characters/characters.dart';
import 'package:dinorun/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DinoGame extends FlameGame with TapDetector, KeyboardEvents {
  ValueNotifier<int> get lives => _dino.lives;

  final _dino = Dino();
  final enemyManager = EnemyManager();

  late final ParallaxComponent _parallax;

  final _scoreText = TextComponent(
    text: '0',
    anchor: Anchor.center,
    textRenderer: TextPaint(
      style: const TextStyle(
        fontSize: 48,
        fontFamily: 'Audiowide',
        color: Colors.white,
      ),
    ),
  );

  int get score => _score;

  int _score = 0;

  static const gravity = 1000;

  @override
  Future<void>? onLoad() async {
    _parallax = await loadParallaxComponent(
      [
        ParallaxImageData('parallax/plx-1.png'),
        ParallaxImageData('parallax/plx-2.png'),
        ParallaxImageData('parallax/plx-3.png'),
        ParallaxImageData('parallax/plx-4.png'),
        ParallaxImageData('parallax/plx-5.png'),
        ParallaxImageData('parallax/plx-6.png'),
      ],
      baseVelocity: Vector2(14, 0),
      velocityMultiplierDelta: Vector2(1.5, 1),
    );

    await add(_parallax);

    await add(_dino);

    await add(_scoreText);

    await add(EnemyManager());
  }

  @override
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);
    _scoreText.position = Vector2(canvasSize.x * 0.5, 50);
  }

  @override
  void update(double dt) {
    super.update(dt);

    _score += (60 * dt).toInt();
    _scoreText.text = '$_score';

    children.whereType<Enemy>().forEach((enemy) {
      if (_dino.distance(enemy) < _dino.size.x * 0.8) {
        _dino.hit();
      }
    });

    if (lives.value <= 0) {
      overlays
        ..remove('Hud')
        ..add('GameOverMenu');

      pauseEngine();
    }
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);
    _dino.jump();
  }

  @override
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is RawKeyDownEvent;

    final isSpace = keysPressed.contains(LogicalKeyboardKey.space);

    if (isSpace && isKeyDown) {
      _dino.jump();

      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
}
