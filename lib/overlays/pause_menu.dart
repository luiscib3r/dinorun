import 'package:dinorun/game/dino_game.dart';
import 'package:flutter/material.dart';

class PauseMenu extends StatelessWidget {
  const PauseMenu({
    super.key,
    required this.game,
  });

  final DinoGame game;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.black.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 100,
            vertical: 50,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Paused',
                style: TextStyle(
                  fontFamily: 'Audiowide',
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 10),
              IconButton(
                iconSize: 48,
                icon: const Icon(
                  Icons.play_arrow_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  game.overlays.add('Hud');
                  game.overlays.remove('PauseMenu');
                  game.resumeEngine();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
