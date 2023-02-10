part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class CartStarted extends CartEvent {
  @override
  List<Object?> get props => [];
}

class CartAddProductToState extends CartEvent {
  final Product product;

  const CartAddProductToState(this.product);

  @override
  List<Object?> get props => [product];
}

class CartRemoveProductToState extends CartEvent {
  final Product product;

  const CartRemoveProductToState(this.product);

  @override
  List<Object?> get props => [product];
}