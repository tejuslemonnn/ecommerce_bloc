import 'package:ecommerce_bloc/config/app_pages.dart';
import 'package:ecommerce_bloc/config/app_routes.dart';
import 'package:ecommerce_bloc/screens/screens.dart';
import 'package:ecommerce_bloc/screens/wishlist/whistlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Text(
          title,
          overflow: TextOverflow.fade,
          style: textTheme.displayMedium!.copyWith(color: Colors.white),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        Visibility(
          visible: ModalRoute.of(context)?.settings.name == Routes.home ? true : false,
          child: IconButton(
              onPressed: () {
                AppRouter.push(context, const WishlistScreen(), Routes.wishlist);
              },
              icon: const Icon(CupertinoIcons.heart_fill)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
