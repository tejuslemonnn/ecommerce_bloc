import 'package:ecommerce_bloc/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_bloc/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_bloc/config/app_pages.dart';
import 'package:ecommerce_bloc/config/app_routes.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:ecommerce_bloc/screens/product/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({
    super.key,
    required this.product,
    required this.widthFactor,
    this.rightPosition,
  });

  final Product product;
  final double widthFactor;
  final double? rightPosition;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        AppRouter.push(
            context, ProductScreen(product: product), Routes.product);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / widthFactor,
              height: 125.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: rightPosition,
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width / widthFactor,
                height: 60.h,
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(150),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                product.name,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.headlineMedium!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "\$${product.price}",
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.titleLarge!
                                    .copyWith(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          if (state is CartInitial) {
                            const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (state is CartLoaded) {
                            return Expanded(
                              child: IconButton(
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(CartAddProductToState(product));

                                  ScaffoldMessenger.of(context).showSnackBar(
                                     SnackBar(
                                      content:
                                      Text('${product.name} Add on your Cart!'),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  CupertinoIcons.add_circled_solid,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            );
                          } else {
                            return const Center(
                              child: Text(
                                "Something Went Wrong",
                              ),
                            );
                          }
                        },
                      ),
                      ModalRoute.of(context)?.settings.name == Routes.wishlist
                          ? BlocBuilder<WishlistBloc, WishlistState>(
                              builder: (context, state) {
                                return IconButton(
                                  onPressed: () {
                                    context.read<WishlistBloc>().add(
                                        RemoveProductFromWishlist(product));

                                    ScaffoldMessenger.of(context).showSnackBar(
                                       SnackBar(
                                        content:
                                            Text('${product.name} Removed from your Wishlist!'),
                                        duration: const Duration(seconds: 1),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.minus_circle_fill,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                );
                              },
                            )
                          : const SizedBox.shrink()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
