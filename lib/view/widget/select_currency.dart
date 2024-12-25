import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/currency_provider.dart';

enum Currency{from, to}

class SelectCurrencyField extends ConsumerWidget {
  final Currency currency;
  const SelectCurrencyField(this.currency, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //available currencies
    final currenciesAsyncValue = ref.watch(availableCurrenciesProvider);

    final fromCurrency = ref.watch(fromCurrencyProvider);
    final toCurrency = ref.watch(toCurrencyProvider);

    return currenciesAsyncValue.when(
      data: (currencies) {
        return Column(
          children: [
            DropdownButtonFormField<String>(
              value: currency == Currency.from?
              fromCurrency:toCurrency,
              onChanged: (value) {

                switch(currency){
                  case Currency.from:
                    ref.read(fromCurrencyProvider.notifier).state = value;
                  case Currency.to:
                    ref.read(toCurrencyProvider.notifier).state = value;
                }
                // ref.read(fromCurrencyProvider.notifier).state = value;
              },
              items: currencies.map((currency) {
                return DropdownMenuItem<String>(
                  value: currency.code,
                  child: Text(currency.name),
                );
              }).toList(),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.blue.shade300, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.blue.shade300, width: 1),
                  ),
                  labelText: currency == Currency.from?'From':'To'),
            ),
          ],
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}



