import 'package:dinorun/game/game.dart';
import 'package:flutter/material.dart';

class GameOverMenu extends StatelessWidget {
  const GameOverMenu({
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
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Game Over',
                style: TextStyle(
                  fontFamily: 'Audiowide',
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Your Score was ${game.score}',
                style: const TextStyle(
                  fontFamily: 'Audiowide',
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 20),
              IconButton(
                iconSize: 48,
                icon: const Icon(
                  Icons.replay,
                  color: Colors.white,
                ),
                onPressed: () {
                  
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
