

import 'dart:math';

import 'case_model.dart';

class MapModel {
  late int nbLine;
  late int nbCol;
  late int nbBomb;
  late List<List<CaseModel>> cases;

  void initMap(nbLine, nbCol, nbBomb) {
    this.nbLine = nbLine;
    this.nbCol = nbCol;
    this.nbBomb = nbBomb;
    generateMap();
  }

  void generateMap() {
    initCases();
    initBomb();
    initNumbers();
  }

  void initCases() {
    cases = List.generate(
      nbLine,
          (x) => List.generate(
        nbCol,
            (y) => CaseModel(),
      ),
    );
  }

  void initBomb() {
    int count = 0;
    Random random = Random();
    while (count < nbBomb) {
      int x = random.nextInt(nbLine);
      int y = random.nextInt(nbCol);
      if (!cases[x][y].hasBomb) {
        cases[x][y].hasBomb = true;
        count++;
      }
    }
  }

  void initNumbers() {
    for (int x = 0; x < nbLine; x++) {
      for (int y = 0; y < nbCol; y++) {
        if (!cases[x][y].hasBomb) {
          cases[x][y].number = computeNumber(x, y);
        }
      }
    }
  }

  int computeNumber(int x, int y) {
    int count = 0;
    for (int dx = -1; dx <= 1; dx++) {
      for (int dy = -1; dy <= 1; dy++) {
        if (dx == 0 && dy == 0) continue;
        if (tryGetCase(x + dx, y + dy)?.hasBomb ?? false) {
          count++;
        }
      }
    }
    return count;
  }

  CaseModel? tryGetCase(int x, int y) {
    if (x >= 0 && x < nbLine && y >= 0 && y < nbCol) {
      return cases[x][y];
    }
    return null;
  }
}