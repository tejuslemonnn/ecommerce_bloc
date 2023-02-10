import 'package:ecommerce_bloc/config/app_routes.dart';
import 'package:ecommerce_bloc/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController zipController = TextEditingController();

    return Scaffold(
      appBar: const CustomAppBar(title: "Checkout"),
      bottomNavigationBar: const CustomNavbar(screen: Routes.checkout),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Customer Information",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            _buildTextFormField(emailController, context, 'email'),
            _buildTextFormField(nameController, context, 'Full Name'),
            Text(
              "Delivery Information",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            _buildTextFormField(addressController, context, 'Address'),
            _buildTextFormField(cityController, context, 'City'),
            _buildTextFormField(countryController, context, 'Country'),
            _buildTextFormField(zipController, context, 'Zip Code'),
            _buttonPaymentMethod(context),
            Text(
              "Order Summary",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const OrderSummary()
          ],
        ),
      ),
    );
  }

  Padding _buildTextFormField(
    TextEditingController controller,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
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

  Widget _buttonPaymentMethod(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
        backgroundColor: MaterialStateProperty.all(Colors.black),
      ),
      onPressed: () {},
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
