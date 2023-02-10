import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';

part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<StartWishlist>(_mapStartWishlistToState);
    on<AddProductToWishlist>(_mapAddWishlistProductToState);
    on<RemoveProductFromWishlist>(_mapRemoveWishlistProductToState);
  }

  void _mapStartWishlistToState(
      StartWishlist event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());

    try {
      await Future.delayed(Duration(seconds: 1));
      emit(WishlistLoaded());
    } catch (_) {}
  }

  void _mapAddWishlistProductToState(
      AddProductToWishlist event, Emitter<WishlistState> emit) async {
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
            wishlist: Wishlist(
                products: List.from((state as WishlistLoaded).wishlist.products)
                  ..add(event.product))));
      } catch (_) {}
    }
  }

  void _mapRemoveWishlistProductToState(
      RemoveProductFromWishlist event, Emitter<WishlistState> emit) async {
    emit(WishlistLoaded(
        wishlist: Wishlist(
            products: List.from((state as WishlistLoaded).wishlist.products)
              ..remove(event.product))));
  }
}
