class Money {
  Money(this._amount) {
    if (_amount < 0) {
      throw Exception('do not minus amount');
    }
  }

  final double _amount;

  double get amount => _amount;

  // int toInt() {
  //   return amount;
  // }

  Money add(Money addAmount) {
    final double added = amount + addAmount.amount;
    return Money(added);
  }

  Money decrease(Money minusAmount) {
    final double decreased = amount - minusAmount.amount;
    return Money(decreased);
  }

  Money devide(int num) {
    final double devided = amount / num;
    return Money(devided);
  }

  Money multi(double num) {
    return Money((amount * num));
  }

  double ratio(Money devidingAmount) {
    return amount / devidingAmount.amount;
  }
}
