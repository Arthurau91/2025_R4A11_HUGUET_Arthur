

import 'dart:math';

import 'case_model.dart';

class MapModel {
  
  int nbLine = 0;
  int nbCol = 0;
  int nbBomb = 0;
  List<List<CaseModel>> _cases = List<List<CaseModel>>.empty();

  void initCases() {
    nbLine = 10;
    nbCol = 10;
    
    _cases = List<List<CaseModel>>.generate(
        nbLine, (i) => List<CaseModel>.generate(
          nbCol, (j) => CaseModel()
      )
    );
  }
  
  void initBombes(double repartition) {
    int x;

    for (List<CaseModel> l in _cases) {
      for (CaseModel c in l) {
        x = Random().nextInt(100);
        c.setBomb(x < repartition);
        if (x < repartition) {
          nbBomb++;
        }
      }
    }
  }

  void initNumbers() {
    for (int x = 0; x <= nbLine; x++) {
      for (int y = 0; y <= nbCol; y++) {
        _cases[x][y].setNumber(computeNumber(x, y));
      }
    }
  }

  void generateMap() {

    initCases();
    initBombes(50);
    initNumbers();
  }

  CaseModel? tryGetCase(int x, int y) {
    CaseModel? c;

    if ((x >= 0 && x <= nbLine) && (y >= 0 && y <= nbCol)) {
      c = _cases[x][y];
    }

    return c;
  }

  int computeNumber(int x, int y) {
    int comp = 0;
    int nx, ny;
    CaseModel? c;

    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        nx = x + i;
        ny = y + i;

        c = tryGetCase(nx, ny);
        if (c != null) {
          if (c.hasbomb) {
            comp++;
          }
        }
      }
    }

    return comp;
  }

  void reveal(int x, int y) {

    CaseModel? c = tryGetCase(x, y);
    if (c != null) {
      c.reveal();
    }
  }

  void revealAll() {

    for (int x = 0; x <= nbLine; x++) {
      for (int y = 0; y <= nbCol; y++) {
        _cases[x][y].reveal();
      }
    }
  }

  void explode(int x, int y) {

    CaseModel? c = tryGetCase(x, y);
    if (c != null) {
      c.explode();
    }
  }

  void toggleFlag(int x, int y) {

    CaseModel? c = tryGetCase(x, y);
    if (c != null) {
      c.toggleFlag();
    }
  }
}