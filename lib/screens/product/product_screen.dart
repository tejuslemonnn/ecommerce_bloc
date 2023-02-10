import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_bloc/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_bloc/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:ecommerce_bloc/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.share,
                  color: Colors.white,
                )),
            BlocBuilder<WishlistBloc, WishlistState>(
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      context
                          .read<WishlistBloc>()
                          .add(AddProductToWishlist(product));

                      ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                          content: Text('${product.name} Add on your Wishlist!'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    icon: const Icon(
                      CupertinoIcons.heart,
                      color: Colors.white,
                    ));
              },
            ),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return TextButton(
                  onPressed: () {
                    context
                        .read<CartBloc>()
                        .add(CartAddProductToState(product));

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${product.name} Add on your Cart!'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  child: Row(
                    children: const [
                      Icon(
                        CupertinoIcons.cart,
                        color: Colors.black,
                      ),
                      Text(
                        "Add To Cart",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            items: [
              HeroCarouselCard(
                product: product,
              ),
            ],
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: textTheme.headlineSmall!
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      "\$${product.price}",
                      style: textTheme.headlineSmall!
                          .copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text("Product Information", style: textTheme.displaySmall),
              children: [
                ListTile(
                  title: Text(
                    "lorem lorem loremloremloremloremlorem lorem lorem lorem loremloremlorem lorem lorem lorem loremloremloremloremlorem loremloremloremlorem loremlorem lorem lorem lorem",
                    style: textTheme.bodyLarge,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ExpansionTile(
              initiallyExpanded: true,
              title:
                  Text("Delivery Information", style: textTheme.displaySmall),
              children: [
                ListTile(
                  title: Text(
                    "lorem lorem loremloremloremloremlorem lorem lorem lorem loremloremlorem lorem lorem lorem loremloremloremloremlorem loremloremloremlorem loremlorem lorem lorem lorem",
                    style: textTheme.bodyLarge,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
