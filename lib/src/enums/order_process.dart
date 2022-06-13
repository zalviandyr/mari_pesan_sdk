enum OrderProcess {
  now('Pesan Sekarang', 'sekarang'),
  later('Pesan Nanti', 'nanti');

  final String label;
  final String apiLabel;
  const OrderProcess(this.label, this.apiLabel);

  @override
  String toString() => label;
}
