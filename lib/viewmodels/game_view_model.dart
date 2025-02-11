
import 'package:counter_app/models/map_model.dart';
import 'package:flutter/foundation.dart';

class GameViewModel extends ChangeNotifier {
  final MapModel _mapModel;

  GameViewModel(this._mapModel);

  void generateMap() {
    _mapModel.generateMap();
  }


}