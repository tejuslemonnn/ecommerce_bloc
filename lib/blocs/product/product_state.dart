part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> product;

  const ProductLoaded({this.product = const <Product>[]});

  @override
  List<Object?> get props => [product];
}
