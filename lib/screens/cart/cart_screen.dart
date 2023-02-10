import 'package:ecommerce_bloc/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_bloc/config/app_pages.dart';
import 'package:ecommerce_bloc/config/app_routes.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:ecommerce_bloc/screens/home/home_screen.dart';
import 'package:ecommerce_bloc/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Cart"),
      bottomNavigationBar:  const CustomNavbar(screen: Routes.cart),
      body: SingleChildScrollView(
        controller: ScrollController(),
        scrollDirection: Axis.vertical,
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is CartLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(state.cart.freeDeliveryString,
                                  style: Theme.of(context).textTheme.headlineSmall),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  AppRouter.pushAndRemoveUntil(
                                      context, const HomeScreen(), Routes.home);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(),
                                    elevation: 0),
                                child: Text(
                                  "Add More Items",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10.0),
                          height: MediaQuery.of(context).size.height / 1.5,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: state.cart.productQuantity(state.cart.products).keys.length,
                            itemBuilder: (context, index) => CartProductCard(
                              product: state.cart.productQuantity(state.cart.products).keys.elementAt(index),
                              quantity: state.cart.productQuantity(state.cart.products).values.elementAt(
                                  index),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const OrderSummary()
                  ],
                ),
              );
            } else {
              return Center(
                child: Text("Something Went Wrong",
                    style: Theme.of(context).textTheme.displayLarge),
              );
            }
          },
        ),
      ),
    );
  }
}

