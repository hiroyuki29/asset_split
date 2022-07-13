class Money {
  Money(this._amount) {
    if (_amount < 0) {
      throw Exception('do not minus amount');
    }
  }

  final int _amount;

  int get amount => _amount;

  // int toInt() {
  //   return amount;
  // }

  Money add(Money addAmount) {
    final int added = amount + addAmount.amount;
    return Money(added);
  }

  Money decrease(Money minusAmount) {
    final int decreased = amount - minusAmount.amount;
    return Money(decreased);
  }

  Money devide(int num) {
    final double devided = amount / num;
    return Money(devided.round());
  }

  Money multi(double num) {
    return Money((amount * num).round());
  }

  double ratio(Money devidingAmount) {
    return amount / devidingAmount.amount;
  }
}
