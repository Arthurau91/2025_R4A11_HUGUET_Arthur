import 'package:counter_app/viewmodels/game_view_model.dart';
import 'package:counter_app/views/game_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => GameViewModel().generateMap(8, 8, 10),
    child: MaterialApp(
      home: GameView(),
    ),
  ));
}
