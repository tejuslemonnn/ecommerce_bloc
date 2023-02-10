import 'package:ecommerce_bloc/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_bloc/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "WISHLIST"),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is WishlistLoaded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 2.4),
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
              itemCount: state.wishlist.products.length,
              itemBuilder: (context, index) => Center(
                child: ProductCart(
                  product: state.wishlist.products[index],
                  widthFactor: 1.1,
                  rightPosition: 0,
                ),
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
    );
  }
}
