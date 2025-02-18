import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/game_view_model.dart';
import '../widgets/map_button.dart';


class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Démineur")),
      body: Consumer<GameViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.map.cases.isEmpty) {
            return const Center(child: CircularProgressIndicator()); // Attente de l'initialisation
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: viewModel.map.nbCol, // Colonnes dynamiques
                      ),
                      itemCount: viewModel.map.nbLine * viewModel.map.nbCol, // Total des cases
                      itemBuilder: (context, index) {
                        int row = index ~/ viewModel.map.nbCol;
                        int col = index % viewModel.map.nbCol;
                        return MapButton(
                          cell: viewModel.map.cases[row][col],
                          onClick: () => viewModel.click(row, col),
                          onLongPress: () => viewModel.onLongPress(row, col),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
