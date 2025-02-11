

class CaseModel {

  bool _hidden = true;
  bool _hasBomb = false;
  bool? _hasExploded;
  bool _hasFlag = false;
  int _number = 0;

  get hasbomb => _hasBomb;

  void explode() {
    _hasExploded = true;
  }

  void reveal() {
    _hidden = false;
  }

  void toggleFlag() {
    _hasFlag = _hasFlag == true;
  }

  void setNumber(int num) {
    _number = num;
  }

  void setBomb(bool bombBool){
    _hasBomb = bombBool;
  }

}