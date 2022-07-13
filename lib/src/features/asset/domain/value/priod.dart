class Period {
  Period(this._amount) {
    if (_amount < 0) {
      throw Exception('Period shoud not be minus amount');
    }
  }

  final int _amount;

  int get amount => _amount;
}
