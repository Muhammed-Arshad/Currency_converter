import 'package:currency_coverter/view/widget/amount_field.dart';
import 'package:currency_coverter/view/widget/select_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/conversion_provider.dart';
import '../providers/currency_provider.dart';

class CurrencyConverterView extends StatelessWidget {
  const CurrencyConverterView({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController amountController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text('Currency Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 15,
          children: [
            SelectCurrencyField(Currency.from),
            SelectCurrencyField(Currency.to),
            AmountField(ctrl: amountController),
            const SizedBox(height: 16.0),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {

                final conversionResult = ref.watch(conversionProvider);

                return Column(
                  children: [

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        foregroundColor: Colors.white, backgroundColor:Colors.amber.shade300,
                        minimumSize: const Size(double.infinity, 45),
                      ),
                      onPressed: () {


                        double amount = 0.0;

                        if(amountController.text.isNotEmpty){
                          amount = double.parse(amountController.text);
                        }

                        final fromCurrency = ref.read(fromCurrencyProvider);
                        final toCurrency = ref.read(toCurrencyProvider);

                        if(fromCurrency != null && toCurrency != null){
                          ref.read(conversionProvider.notifier).convertCurrency(
                            fromCurrency,
                            toCurrency,
                            amount,
                          );
                        }

                      },
                      child: const Text('Convert',style: TextStyle(color: Colors.black54),),
                    ),
                    const SizedBox(height: 25.0),

                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Converted Amount: '),
                          TextSpan(text: conversionResult.toStringAsFixed(2),
                              style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 22,color: Colors.blueAccent)),
                        ],
                      ),
                    )

                    // Text('Converted Amount: ${conversionResult.toStringAsFixed(2)}',
                    //  style: ,),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
