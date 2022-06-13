class AppError implements Exception {
  String message;
  bool isToast;

  AppError(this.message, {this.isToast = true});
}
