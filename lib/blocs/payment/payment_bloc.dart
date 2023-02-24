import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'payment_event.dart';

part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<LoadPaymentMethod>(_onLoadPaymentMethod);
    on<SelectPaymentMethod>(_onSelectPaymentMethod);
  }

  void _onLoadPaymentMethod(
      LoadPaymentMethod event, Emitter<PaymentState> emit) {
    emit(
      const PaymentLoaded(),
    );
  }

  void _onSelectPaymentMethod(
      SelectPaymentMethod event, Emitter<PaymentState> emit) {
    emit(
      PaymentLoaded(paymentMethod: event.paymentMethod),
    );
  }
}
