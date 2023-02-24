import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_bloc/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_bloc/blocs/payment/payment_bloc.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:ecommerce_bloc/repositories/checkout/checkout_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'checkout_event.dart';

part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final PaymentBloc _paymentBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _paymentSubscription;
  StreamSubscription? checkoutSubscription;

  CheckoutBloc({
    required CartBloc cartBloc,
    required PaymentBloc paymentBloc,
    required CheckoutRepository checkoutRepository,
  })  : _cartBloc = cartBloc,
        _paymentBloc = paymentBloc,
        _checkoutRepository = checkoutRepository,
        super(cartBloc.state is CartLoaded
            ? CheckoutLoaded(
                products: (cartBloc.state as CartLoaded).cart.products,
                subtotal: (cartBloc.state as CartLoaded).cart.subTotalString,
                deliveryFee:
                    (cartBloc.state as CartLoaded).cart.deliveryFeeString,
                total: (cartBloc.state as CartLoaded).cart.totalString)
            : CheckoutInitial()) {
    on<UpdateCheckout>(_mapUpdateCheckoutToState);
    on<ConfirmCheckout>(_mapConfirmCheckoutToState);

    _cartSubscription = cartBloc.stream.listen((state) {
      if (state is CartLoaded) {
        add(UpdateCheckout(cart: state.cart));
      }
    });

    _paymentSubscription = _paymentBloc.stream.listen((state) {
      if(state is PaymentLoaded){
        add(
          UpdateCheckout(paymentMethod: state.paymentMethod),
        );
      }
    });
  }

  void _mapUpdateCheckoutToState(
      UpdateCheckout event, Emitter<CheckoutState> emit) {
    if (state is CheckoutLoaded) {
      final state = this.state as CheckoutLoaded;
      emit(
        CheckoutLoaded(
          email: event.email ?? state.email,
          fullName: event.fullName ?? state.fullName,
          products: event.cart?.products ?? state.products,
          deliveryFee: event.cart?.deliveryFeeString ?? state.deliveryFee,
          subtotal: event.cart?.subTotalString ?? state.subtotal,
          total: event.cart?.totalString ?? state.total,
          address: event.address ?? state.address,
          city: event.city ?? state.city,
          country: event.country ?? state.country,
          zipCode: event.zipCode ?? state.zipCode,
          paymentMethod: event.paymentMethod ?? state.paymentMethod,
        ),
      );
    }
  }

  void _mapConfirmCheckoutToState(
      ConfirmCheckout event, Emitter<CheckoutState> emit) async {
    _cartSubscription?.cancel();
    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        print("Checkout Saved");
        emit(CheckoutInitial());
      } catch (_) {}
    }
  }
}
