enum PaymentMethod {
  gopay('GoPay', 'GOPAY'),
  ovo('OVO', 'OVO'),
  linkAja('LinkAja', 'LINKAJA'),
  dana('DANA', 'DANA'),
  shopeePay('ShopeePay', 'SHOPEEPAY');

  final String label;
  final String apiLabel;

  const PaymentMethod(this.label, this.apiLabel);

  factory PaymentMethod.fromApiLabel(String label) {
    if (label == PaymentMethod.gopay.apiLabel) {
      return PaymentMethod.gopay;
    } else if (label == PaymentMethod.ovo.apiLabel) {
      return PaymentMethod.ovo;
    } else if (label == PaymentMethod.linkAja.apiLabel) {
      return PaymentMethod.linkAja;
    } else if (label == PaymentMethod.dana.apiLabel) {
      return PaymentMethod.dana;
    } else {
      return PaymentMethod.shopeePay;
    }
  }
}
