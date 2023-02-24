import 'package:ecommerce_bloc/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_bloc/blocs/category/category_bloc.dart';
import 'package:ecommerce_bloc/blocs/checkout/checkout_bloc.dart';
import 'package:ecommerce_bloc/blocs/payment/payment_bloc.dart';
import 'package:ecommerce_bloc/blocs/product/product_bloc.dart';
import 'package:ecommerce_bloc/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_bloc/config/theme.dart';
import 'package:ecommerce_bloc/firebase_options.dart';
import 'package:ecommerce_bloc/repositories/category/category_repository.dart';
import 'package:ecommerce_bloc/repositories/checkout/checkout_repository.dart';
import 'package:ecommerce_bloc/repositories/products/product_repository.dart';
import 'package:ecommerce_bloc/screens/splash/splash_screen.dart';
import 'package:ecommerce_bloc/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = SimpleBlocObserver();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GlobalKey mtAppKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
          create: (_) => PaymentBloc()..add(LoadPaymentMethod()),
        ),
        BlocProvider(
            create: (_) =>
                CategoryBloc(categoryRepository: CategoryRepository())
                  ..add(LoadCategories())),
        BlocProvider(
          create: (_) => ProductBloc(productRepository: ProductRepository())
            ..add(LoadProduct()),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(
              cartBloc: context.read<CartBloc>(),
              paymentBloc: context.read<PaymentBloc>(),
              checkoutRepository: CheckoutRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // onGenerateRoute: AppRouter.onGenerateRoute,
        builder: (context, child) {
          ScreenUtil.init(context);
          return child!;
        },
        theme: theme(),
        title: 'Bloc Shop',
        home: const SplashScreen(),
      ),
    );
  }
}
