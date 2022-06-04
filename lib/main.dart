import 'package:dinorun/game/game.dart';
import 'package:dinorun/overlays/overlays.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Flame.device.fullScreen();
  await Flame.device.setLandscape();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GameWidget<DinoGame>(
          game: DinoGame(),
          overlayBuilderMap: overlaysBuilderMap,
          initialActiveOverlays: const ['Hud'],
        ),
      ),
    ),
  );
}
