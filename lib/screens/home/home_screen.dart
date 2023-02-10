import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_bloc/blocs/category/category_bloc.dart';
import 'package:ecommerce_bloc/blocs/product/product_bloc.dart';
import 'package:ecommerce_bloc/config/app_routes.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:ecommerce_bloc/widgets/product_carousel.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_bloc/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Product> products = Product.products;

    return Scaffold(
      appBar: const CustomAppBar(title: "BLOC SHOP"),
      bottomNavigationBar:  const CustomNavbar(screen: Routes.home),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                print(state);
                if (state is CategoryLoading) {
                  const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                        aspectRatio: 1.5,
                        viewportFraction: 0.9,
                        enlargeCenterPage: true,
                        autoPlay: true),
                    items: state.categories
                        .map((category) => HeroCarouselCard(category: category))
                        .toList(),
                  );
                } else {
                  return const Center(
                    child: Text("Something Went Wrong!"),
                  );
                }
              },
            ),
            // Recommend Product
            const SectionTitle(title: "RECOMMENDED"),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is ProductLoaded) {
                  return ProductCarousel(
                    products: state.product
                        .where((product) => product.isRecommended)
                        .toList(),
                  );
                } else {
                  return const Center(
                    child: Text("Something Went Wrong!"),
                  );
                }
              },
            ),
            //  Popular Product
            const SectionTitle(title: "POPULAR"),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is ProductLoaded) {
                  return ProductCarousel(
                    products: state.product
                        .where((product) => product.isPopular)
                        .toList(),
                  );
                } else {
                  return const Center(
                    child: Text("Something Went Wrong!"),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
