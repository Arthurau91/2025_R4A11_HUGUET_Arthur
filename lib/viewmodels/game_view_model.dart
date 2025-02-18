
import 'package:counter_app/models/map_model.dart';
import 'package:flutter/foundation.dart';

import '../models/case_model.dart';

class GameViewModel extends ChangeNotifier {
  final MapModel _map = MapModel();

  GameViewModel generateMap(int lines, int cols, int bombs) {
    _map.initMap(lines, cols, bombs);
    return this;
  }

  void click(int x, int y) {
    if (_map.cases[x][y].hasBomb) {
      _map.cases[x][y].hasExploded = true;
      revealAll();
    }
    if (map.cases[x][y].hidden) {
        revealAdjacentCells(x, y);
    }
  }

  void revealAdjacentCells(int row, int col) {
    if (!_isValidPosition(row, col) || !map.cases[row][col].hidden) {
      return;
    }

    map.cases[row][col].hidden = false;

    // Si la case a une mine ou un nombre, on ne propage pas
    if (map.cases[row][col].hasBomb || map.cases[row][col].number! > 0) {
      notifyListeners();
      return;
    }

    // Coordonnées des 8 cases adjacentes
    List<List<int>> directions = [
      [-1, -1], [-1, 0], [-1, 1],  // Haut gauche, Haut, Haut droite
      [0, -1],         [0, 1],    // Gauche, Droite
      [1, -1], [1, 0], [1, 1],    // Bas gauche, Bas, Bas droite
    ];

    for (var dir in directions) {
      int newRow = row + dir[0];
      int newCol = col + dir[1];
      if (_isValidPosition(newRow, newCol) && map.cases[newRow][newCol].hidden) {
        revealAdjacentCells(newRow, newCol);
      }
    }

    notifyListeners();
  }

// Vérifie si la position est valide dans la grille
  bool _isValidPosition(int row, int col) {
    return row >= 0 && row < map.nbLine && col >= 0 && col < map.nbCol;
  }


  void onLongPress(int x, int y) {
    if (!_map.cases[x][y].hidden) return;

    _map.cases[x][y].hasFlag = !_map.cases[x][y].hasFlag;
    notifyListeners();
  }

  void revealAll() {
    for (var row in _map.cases) {
      for (var cell in row) {
        cell.hidden = false;
      }
    }
    notifyListeners();
  }

  List<List<CaseModel>> get cases => _map.cases;

  MapModel get map => _map;
}