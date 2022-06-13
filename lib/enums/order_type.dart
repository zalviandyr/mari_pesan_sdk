enum OrderType {
  dineIn('Dine In', 'dinein'),
  takeAway('Take Away', 'takeaway');

  final String label;
  final String apiLabel;
  const OrderType(this.label, this.apiLabel);

  @override
  String toString() => label;
}
