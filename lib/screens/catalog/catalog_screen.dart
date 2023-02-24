import 'package:ecommerce_bloc/config/app_routes.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:ecommerce_bloc/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key, this.category})
      : super(key: key);

  final Category? category;

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products.where((element) => element.category == category?.name).toList();

    return Scaffold(
      appBar: CustomAppBar(title: "${category?.name}"),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.15),
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 16.0,
        ),
        itemCount: categoryProducts.length,
        itemBuilder: (context, index) =>
            Center(child: ProductCart(product: categoryProducts[index], widthFactor: 2.5,)),
      ),
    );
  }
}
