// import 'package:ecommerce_bloc/config/app_routes.dart';
// import 'package:ecommerce_bloc/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  // static Route onGenerateRoute(RouteSettings settings) {
  //   print("this is route: ${settings.name}");
  //
  //   switch (settings.name) {
  //     case Routes.home:
  //       return materialPageRoute(Routes.home, const HomeScreen());
  //     case Routes.cart:
  //       return materialPageRoute(Routes.cart, const CartScreen());
  //     case Routes.catalog:
  //       return materialPageRoute(Routes.catalog, const CatalogScreen());
  //     case Routes.product:
  //       return materialPageRoute(Routes.product, const ProductScreen());
  //     case Routes.wishlist:
  //       return materialPageRoute(Routes.wishlist, const WishlistScreen());
  //     default:
  //       return _errorRoute();
  //   }
  // }

  // static Route _errorRoute() {
  //   return MaterialPageRoute(
  //     settings: const RouteSettings(name: Routes.errorPage),
  //     builder: (context) =>
  //         Scaffold(
  //           appBar: AppBar(
  //             title: const Text("Error"),
  //           ),
  //         ),
  //   );
  // }

  static MaterialPageRoute materialPageRoute(String name, page) {
    return MaterialPageRoute(
      settings: RouteSettings(name: name),
      builder: (context) => page,
    );
  }

  static push(BuildContext context,Widget page, String routeName){
    return Navigator.push(
      context,
      FadeInRoute(page: page, routeName: routeName),
    );
  }

  static pushAndRemoveUntil(BuildContext context, Widget page, String routeName){
    return Navigator.pushAndRemoveUntil(
      context,
      FadeInRoute(page: page, routeName: routeName),
      (route) => false,
    );
  }
}

class FadeInRoute extends PageRouteBuilder {
  final Widget page;

  FadeInRoute({required this.page, required String routeName})
      : super(
    settings: RouteSettings(name: routeName),
    pageBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,) => page,
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
    transitionDuration: const Duration(milliseconds: 500),
  );
}