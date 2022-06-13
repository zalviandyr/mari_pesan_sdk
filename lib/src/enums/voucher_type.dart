enum VoucherType {
  percent('percent'),
  amount('amount');

  final String apiLabel;
  const VoucherType(this.apiLabel);
}
