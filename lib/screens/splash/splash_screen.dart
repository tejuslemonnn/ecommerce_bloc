import 'dart:async';

import 'package:ecommerce_bloc/config/app_pages.dart';
import 'package:ecommerce_bloc/config/app_routes.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:ecommerce_bloc/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      AppRouter.pushAndRemoveUntil(context, const HomeScreen(), Routes.home);
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/logo_bloc_shop.png')),
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Text(
              "BLOC SHOP",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
