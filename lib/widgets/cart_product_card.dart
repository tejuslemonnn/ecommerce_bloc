import 'package:ecommerce_bloc/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({Key? key, required this.product, required this.quantity}) : super(key: key);

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(product.imageUrl,
                width: 150, height: 120, fit: BoxFit.cover),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "\$${product.price}",
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is CartLoaded) {
                return Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(CartAddProductToState(product));
                      },
                      icon: const Icon(
                        CupertinoIcons.add_circled_solid,
                        size: 30,
                      ),
                    ),
                    Text(
                      "$quantity",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    IconButton(
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(CartRemoveProductToState(product));
                      },
                      icon: const Icon(
                        CupertinoIcons.minus_circle_fill,
                        size: 30,
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text("Something Went Wrong",
                      style: Theme.of(context).textTheme.displayLarge),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
