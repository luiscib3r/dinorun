import 'package:dinorun/game/game.dart';
import 'package:dinorun/overlays/overlays.dart';
import 'package:flutter/material.dart';

export 'game_over_menu.dart';
export 'hud.dart';
export 'pause_menu.dart';

final overlaysBuilderMap = <String, Widget Function(BuildContext, DinoGame)>{
  'Hud': (context, game) {
    return Hud(game: game);
  },
  'PauseMenu': (context, game) {
    return PauseMenu(game: game);
  },
  'GameOverMenu': (context, game) {
    return GameOverMenu(game: game);
  }
};
