import 'package:ecommerce_bloc/config/app_routes.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:ecommerce_bloc/widgets/custom_appbar.dart';
import 'package:ecommerce_bloc/widgets/custom_navbar.dart';
import 'package:ecommerce_bloc/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Order Confirmation"),
      bottomNavigationBar: const CustomNavbar(screen: Routes.orderConfirmation),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3,
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width - 100) / 2,
                  top: 100,
                  child: SvgPicture.asset(
                    "assets/svg/garlands.svg",
                  ),
                ),
                Positioned(
                  top: 225,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Your Order Is Complete!",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ORDER CODE: #k321-ekd3",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Thank you for purchasing on BLOC Shop",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "ORDER CODE: #k321-ekd3",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const OrderSummary(),
                  const SizedBox(height: 20),
                  Text(
                    "Order Detail",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 5),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) => OrderSummaryProductCard(
                      product: Product.products[0],
                      quantity: 2,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderSummaryProductCard extends StatelessWidget {
  const OrderSummaryProductCard({
    super.key,
    required this.product,
    required this.quantity,
  });

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
              height: 100.h,
              width: 100.h,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "Qty. $quantity",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              "\$${product.price}",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}
