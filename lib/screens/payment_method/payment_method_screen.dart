import 'package:ecommerce_bloc/blocs/payment/payment_bloc.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:ecommerce_bloc/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Payment Method"),
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if (state is PaymentInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is PaymentLoaded) {
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                RawGooglePayButton(
                  onPressed: () {
                    context.read<PaymentBloc>().add(
                          const SelectPaymentMethod(
                              paymentMethod: PaymentMethod.googlePay),
                        );
                    Navigator.pop(context);
                  },
                  type: GooglePayButtonType.pay,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    style:  const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                    onPressed: () {
                      context.read<PaymentBloc>().add(const SelectPaymentMethod(
                          paymentMethod: PaymentMethod.creditCard));
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Pay with Credit Card",
                    ))
              ],
            );
          } else {
            return Center(
              child: Text(
                "Something Went Wrong",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            );
          }
        },
      ),
    );
  }
}
