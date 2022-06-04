
import 'package:dinorun/game/dino_game.dart';
import 'package:flutter/material.dart';

class Hud extends StatelessWidget {
  const Hud({
    super.key,
    required this.game,
  });

  final DinoGame game;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            game.paused ? Icons.play_arrow : Icons.pause,
            color: Colors.white,
            size: 32,
          ),
          onPressed: () {
            if (game.paused) {
              game.overlays.add('Hud');
              game.overlays.remove('PauseMenu');
              game.resumeEngine();
            } else {
              game.overlays.remove('Hud');
              game.overlays.add('PauseMenu');
              game.pauseEngine();
            }
          },
        ),
        ValueListenableBuilder<int>(
          valueListenable: game.lives,
          builder: (context, value, _) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  for (var i = 0; i < 5; i++)
                    Icon(
                      i < value ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                ].reversed.toList(),
              ),
            );
          },
        ),
      ],
    );
  }
}
