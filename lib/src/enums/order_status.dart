enum OrderStatus {
  unpaid('Unpaid', 'Unpaid'),
  paid('Paid', 'Paid'),
  waiting('Waiting for Confirmation', 'Waiting'),
  accepted('Accepted', 'Accepted'),
  finished('Finished', 'Finished'),
  cancelled('Cancelled', 'Cancelled');

  final String label;
  final String apiLabel;
  const OrderStatus(this.label, this.apiLabel);

  factory OrderStatus.fromApiLabel(String label) {
    if (label == OrderStatus.unpaid.apiLabel) {
      return OrderStatus.unpaid;
    } else if (label == OrderStatus.paid.apiLabel) {
      return OrderStatus.paid;
    } else if (label == OrderStatus.waiting.apiLabel) {
      return OrderStatus.waiting;
    } else if (label == OrderStatus.accepted.apiLabel) {
      return OrderStatus.accepted;
    } else if (label == OrderStatus.finished.apiLabel) {
      return OrderStatus.finished;
    } else {
      return OrderStatus.cancelled;
    }
  }

  static List<OrderStatus> get inProgressStatus {
    return [OrderStatus.unpaid, OrderStatus.waiting, OrderStatus.accepted];
  }

  static List<OrderStatus> get historyStatus {
    return [OrderStatus.finished, OrderStatus.cancelled];
  }
}
