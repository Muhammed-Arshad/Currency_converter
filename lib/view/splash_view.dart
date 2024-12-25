import 'dart:async';

import 'package:currency_coverter/view/currency_converter_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to the next screen after a 2-second delay
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CurrencyConverterView()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Text('Currency Converter',
          style: TextStyle(fontSize: 25,color: Colors.black87),),
      ),
    );
  }
}

