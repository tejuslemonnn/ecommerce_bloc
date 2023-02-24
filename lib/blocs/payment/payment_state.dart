part of 'payment_bloc.dart';

@immutable
abstract class PaymentState extends Equatable{
  const PaymentState();

  @override
  List<Object?> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentLoaded extends PaymentState{
  final PaymentMethod paymentMethod;

  const PaymentLoaded({this.paymentMethod = PaymentMethod.creditCard});

  @override
  List<Object?> get props => [paymentMethod];
}
