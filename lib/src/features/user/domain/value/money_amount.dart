class Money {
  Money({required this.amount}) {
    if (amount < 0) {
      throw Exception('do not minus amount');
    }
  }

  int amount;

  int toInt() {
    return amount;
  }

  Money add(Money addAmount) {
    final int added = amount + addAmount.amount;
    return Money(amount: added);
  }

  Money decrease(Money minusAmount) {
    final int decreased = amount - minusAmount.amount;
    return Money(amount: decreased);
  }

  Money devide(int num) {
    final double devided = amount / num;
    return Money(amount: devided.round());
  }

  Money multi(double num) {
    return Money(amount: (amount * num).round());
  }

  double ratio(Money devidingAmount) {
    return amount / devidingAmount.toInt();
  }
}
