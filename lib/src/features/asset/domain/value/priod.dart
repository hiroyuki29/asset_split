class Period {
  Period({
    required this.year,
    required this.month,
    required this.day,
  }) : amountList = [year, month, day];

  final List<int> amountList;
  final int year;
  final int month;
  final int day;

  factory Period.fromList(List<int> list) {
    return Period(
      year: list[0],
      month: list[1],
      day: list[2],
    );
  }
}
