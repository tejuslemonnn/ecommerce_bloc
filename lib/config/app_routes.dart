class Routes {
  Routes._();

  static const splash = _Paths.splash;
  static const home = _Paths.home;
  static const cart = _Paths.cart;
  static const catalog = _Paths.catalog;
  static const product = _Paths.product;
  static const wishlist = _Paths.wishlist;
  static const checkout = _Paths.checkout;
  static const orderConfirmation = _Paths.orderConfirmation;
  static const paymentMethod = _Paths.paymentMethod;

  static const errorPage = _Paths.errorPage;
}

class _Paths {
  _Paths._();

  static const splash = '/splash';
  static const home = '/';
  static const cart = '/cart';
  static const catalog = '/catalog';
  static const product = '/product';
  static const wishlist = '/wishlist';
  static const checkout = '/checkout';
  static const orderConfirmation = "/order_confirmation";
  static const paymentMethod = "/payment_method";

  static const errorPage = '/error';
}
