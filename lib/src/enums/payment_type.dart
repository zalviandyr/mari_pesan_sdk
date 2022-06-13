enum PaymentType {
  treat('Traktir', 'traktir'),
  individual('Sendiri-sendiri', 'sendiri');

  final String label;
  final String apiLabel;
  const PaymentType(this.label, this.apiLabel);
}
