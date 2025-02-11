

import 'package:counter_app/models/CounterModel.dart';
import 'package:flutter/foundation.dart';

class CounterViewModel extends ChangeNotifier {
  final CounterModel _counter;

  CounterViewModel(this._counter);

  CounterModel get counter => _counter;

  void incrementCounter() {
    _counter.incrementCounter();
    notifyListeners();
  }

  // Méthode de décrémentation du compteur
  void decrementCounter() {
    _counter.decrementCounter();
    notifyListeners();
  }
}