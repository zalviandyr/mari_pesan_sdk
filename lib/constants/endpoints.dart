class Endpoints {
  static const String user = '/v1/users';
  static const String userPhone = '/v1/users/phone';
  static const String restaurant = '/v1/restaurants';
  static const String categories = '/v1/restaurants/categories';
  static const String menu = '/v1/restaurants/%s/menu';
  static const String favorites = '/v1/users/%s/favourites';
  static const String favoritesDelete = '/v1/users/favourites/%s';
  static const String myCart = '/v1/me/carts';
  static const String cart = '/v1/carts';
  static const String cartShare = '/v1/carts/%s/shares';
  static const String cartDetail = '/v1/carts/%s';
  static const String cartDetailCreate = '/v1/carts/%s/details';
  static const String cartDetailEditDelete = '/v1/carts/details/%s';
  static const String myOrder = '/v1/me/orders';
  static const String order = '/v1/orders/';
  static const String orderDelete = '/v1/orders/%s';
  static const String orderDetail = '/v1/orders/%s/details';
  static const String orderPayment = '/v1/orders/%s/payments';
  static const String voucher = '/v1/admins/vouchers/apply';
}
