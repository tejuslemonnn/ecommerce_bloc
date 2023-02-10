import 'package:ecommerce_bloc/models/models.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  const Cart({this.products = const <Product>[]});

  final List<Product> products;

  @override
  List<Object?> get props => [products];

  Map productQuantity(products) {
    var quantity = {};

    products.forEach((products) {
      if (!quantity.containsKey(products)) {
        quantity[products] = 1;
      } else {
        quantity[products] += 1;
      }
    });

    return quantity;
  }

  double get subTotal =>
      products.fold(0, (total, product) => total + product.price);

  double deliveryFee(subTotal) {
    if (subTotal >= 30.0) {
      return 0.00;
    } else {
      return 10.0;
    }
  }

  String freeDelivery(subtotal) {
    if (subTotal >= 30.0) {
      return "You Have Free Delivery";
    } else {
      double missing = 30.0 - subTotal;

      return "Add \$${missing.toStringAsFixed(2)} for Free Delivery";
    }
  }

  double total(subTotal, deliveryFee) {
    return subTotal + deliveryFee(subTotal);
  }

  String get subTotalString => subTotal.toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subTotal).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subTotal);

  String get totalString => total(subTotal, deliveryFee).toStringAsFixed(2);
}
