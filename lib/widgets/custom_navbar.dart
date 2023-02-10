import 'package:ecommerce_bloc/blocs/checkout/checkout_bloc.dart';
import 'package:ecommerce_bloc/config/app_pages.dart';
import 'package:ecommerce_bloc/config/app_routes.dart';
import 'package:ecommerce_bloc/screens/cart/cart_screen.dart';
import 'package:ecommerce_bloc/screens/checkout/checkout_screen.dart';
import 'package:ecommerce_bloc/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({
    super.key,
    required this.screen,
  });

  final String screen;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 70,
        child: screen == Routes.cart
            ? const GoToCheckoutNavBar()
            : screen == Routes.checkout
                ? const OrderNowNavbar()
                : const HomeNavbar(),
      ),
    );
  }
}

class HomeNavbar extends StatelessWidget {
  const HomeNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: ModalRoute.of(context)?.settings.name == Routes.home
              ? null
              : () {
                  AppRouter.push(context, const HomeScreen(), Routes.home);
                },
          icon: Icon(
              ModalRoute.of(context)?.settings.name == Routes.home
                  ? CupertinoIcons.house_fill
                  : CupertinoIcons.house,
              color: Colors.white),
        ),
        IconButton(
            onPressed: ModalRoute.of(context)?.settings.name == Routes.cart
                ? null
                : () {
                    AppRouter.push(context, const CartScreen(), Routes.cart);
                  },
            icon: Icon(
                ModalRoute.of(context)?.settings.name == Routes.cart
                    ? CupertinoIcons.cart_fill
                    : CupertinoIcons.cart,
                color: Colors.white)),
        IconButton(
            onPressed: () {
              AppRouter.push(context, const HomeScreen(), Routes.home);
            },
            icon: const Icon(CupertinoIcons.person, color: Colors.white)),
      ],
    );
  }
}

class GoToCheckoutNavBar extends StatelessWidget {
  const GoToCheckoutNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            AppRouter.push(context, CheckoutScreen(), Routes.checkout);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(),
          ),
          child: Text(
            'GO TO CHECKOUT',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ],
    );
  }
}

class OrderNowNavbar extends StatelessWidget {
  const OrderNowNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        if (state is CheckoutInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is CheckoutLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context
                      .read<CheckoutBloc>()
                      .add(ConfirmCheckout(checkout: state.checkout));
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Text(
                  'ORDER NOW',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: Text("Something Went Wrong!"),
          );
        }
      },
    );
  }
}
