import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:ecommerce_bloc/repositories/products/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()) {
    on<LoadProduct>(_onLoadProducts);
    on<UpdateProduct>(_onUpdateProducts);
  }

  void _onLoadProducts(LoadProduct event, Emitter<ProductState> emit) {
    _productSubscription?.cancel();
    _productSubscription = _productRepository.getAllProducts().listen(
          (products) => add(
            UpdateProduct(products),
          ),
        );
  }

  void _onUpdateProducts(UpdateProduct event, Emitter<ProductState> emit) {
    emit(
      ProductLoaded(product: event.product),
    );
  }
}
