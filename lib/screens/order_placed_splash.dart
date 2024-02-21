import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrderSplash extends StatefulWidget {
  const OrderSplash({super.key});

  @override
  State<OrderSplash> createState() => _OrderSplashState();
}

class _OrderSplashState extends State<OrderSplash> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3, milliseconds: 30), () {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: LottieBuilder.asset('assets/animation/order_placed.json'),
        ),
      ),
    );
  }
}
