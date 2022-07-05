class Money {
  Money({required this.amount}) {
    if (amount < 0) {
      throw Exception('do not minus amount');
    }
  }

  int amount;

  Money add(Money addAmount) {
    final int added = amount + addAmount.amount;
    return Money(amount: added);
  }
}
