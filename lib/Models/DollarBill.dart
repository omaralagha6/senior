class DollarBill {
  final String serialNb , amount;
  String? seriesYear,reserveBank;

  DollarBill(
      {required this.serialNb,
      required this.reserveBank,
      this.seriesYear,
      required this.amount});
}
