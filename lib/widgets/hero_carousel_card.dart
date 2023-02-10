import 'package:ecommerce_bloc/config/app_pages.dart';
import 'package:ecommerce_bloc/config/app_routes.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:ecommerce_bloc/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroCarouselCard extends StatelessWidget {
  const HeroCarouselCard({
    super.key,
     this.category, this.product,
  });

  final Product? product;
  final Category? category;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        if(product == null){
          AppRouter.push(
              context, CatalogScreen(category: category), Routes.catalog);
        }
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
          top: 20.0,
          bottom: 10.0,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                product == null ? category!.imageUrl : product!.imageUrl,
                fit: BoxFit.cover,
                width: 1000.0.w,
              ),
            ),
            product ==  null ? Positioned(
              bottom: 0.0,
              left: 50,
              right: 50,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  category!.name.length > 10
                      ? category!.name.substring(0, 10)
                      : category!.name,
                  textAlign: TextAlign.center,
                  style: textTheme.displayMedium!.copyWith(color: Colors.white),
                ),
              ),
            ) : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
