import 'package:ecommerce_bloc/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is CartLoaded) {
          return Column(
            children: [
              const Divider(thickness: 2),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal",
                            style: Theme
                                .of(context)
                                .textTheme
                                .displaySmall),
                        Text("\$${state.cart.subTotalString}",
                            style: Theme
                                .of(context)
                                .textTheme
                                .displaySmall),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery Fee",
                            style: Theme
                                .of(context)
                                .textTheme
                                .displaySmall),
                        Text("\$${state.cart.deliveryFeeString}",
                            style: Theme
                                .of(context)
                                .textTheme
                                .displaySmall),
                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.black.withAlpha(20)),
                  ),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    margin: const EdgeInsets.all(5),
                    height: 50,
                    decoration:
                    const BoxDecoration(color: Colors.black),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: Colors.white)),
                          Text("\$${ state.cart.totalString}",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: Colors.white)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        } else {
          return const Center(child: Text("Something Went Wrong!"),);
        }
      },
    );
  }
}
