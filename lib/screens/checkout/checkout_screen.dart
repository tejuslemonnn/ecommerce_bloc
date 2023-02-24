import 'package:ecommerce_bloc/blocs/checkout/checkout_bloc.dart';
import 'package:ecommerce_bloc/config/app_pages.dart';
import 'package:ecommerce_bloc/config/app_routes.dart';
import 'package:ecommerce_bloc/screens/payment_method/payment_method_screen.dart';
import 'package:ecommerce_bloc/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutScreen extends StatelessWidget {
   CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final TextEditingController emailController = TextEditingController();
    // final TextEditingController nameController = TextEditingController();
    // final TextEditingController addressController = TextEditingController();
    // final TextEditingController cityController = TextEditingController();
    // final TextEditingController countryController = TextEditingController();
    // final TextEditingController zipController = TextEditingController();

    return Scaffold(
      appBar:  const CustomAppBar(title: "Checkout"),
      bottomNavigationBar:  const CustomNavbar(screen: Routes.checkout),
      body: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutInitial) {
            return  const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is CheckoutLoaded) {
            return SingleChildScrollView(
              controller: ScrollController(),
              child: Padding(
                padding:  const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Customer Information",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    CustomTextFormField(
                      title: 'Email',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(email: value));
                      },
                    ),
                    CustomTextFormField(
                      title: 'Full Name',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(fullName: value));
                      },
                    ),
                     SizedBox(height: 20.h),
                    Text(
                      "Delivery Information",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    CustomTextFormField(
                      title: 'Address',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(address: value));
                      },
                    ),
                    CustomTextFormField(
                      title: 'City',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(city: value));
                      },
                    ),
                    CustomTextFormField(
                      title: 'Country',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(country: value));
                      },
                    ),
                    CustomTextFormField(
                      title: 'ZIP Code',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(zipCode: value));
                      },
                    ),
                     SizedBox(height: 20.h),
                    _buttonPaymentMethod(context),
                     SizedBox(height: 20.h),
                    Text(
                      "Order Summary",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                     const OrderSummary()
                  ],
                ),
              ),
            );
          } else {
            return  const Center(
              child: Text("Something Went Wrong!"),
            );
          }
        },
      ),
    );
  }

  Widget _buttonPaymentMethod(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding:  const MaterialStatePropertyAll(EdgeInsets.all(20)),
        backgroundColor: MaterialStateProperty.all(Colors.black),
      ),
      onPressed: () {
        AppRouter.push(context, PaymentMethodScreen(), Routes.paymentMethod);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Text(
              'SELECT A PAYMENT METHOD',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: Colors.white),
            ),
          ),
           const Icon(
            CupertinoIcons.arrow_right,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String title;
  final Function(String)? onChanged;

   CustomTextFormField({
    super.key,
    required this.title,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              // controller: controller,
              decoration:  const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(10),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
        ],
      ),
    );
  }
}
