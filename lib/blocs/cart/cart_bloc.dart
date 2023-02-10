import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_mapCartStarted);
    on<CartAddProductToState>(_mapCartAddProductToState);
    on<CartRemoveProductToState>(_mapCartRemoveProductToState);
  }

  void _mapCartStarted(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());

    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(CartLoaded());
    } catch (_) {}
  }

  void _mapCartAddProductToState(
      CartAddProductToState event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from((state as CartLoaded).cart.products)
                ..add(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }

  void _mapCartRemoveProductToState(
      CartRemoveProductToState event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from((state as CartLoaded).cart.products)
                ..remove(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }
}
