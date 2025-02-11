

class CounterModel {
  int _counter = 0;

  int get counter => _counter;

  // Méthode d'incrémentation du compteur
  void incrementCounter() {
    _counter++;
  }

  // Méthode de décrémentation du compteur
  void decrementCounter() {
    _counter--;
  }
}