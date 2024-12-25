import 'package:currency_coverter/providers/conversion_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/currency_model.dart';

// final availableCurrenciesProvider = Provider<List<Currency>>((ref) {
//   return [
//     Currency(code: 'USD', name: 'US Dollar'),
//     Currency(code: 'EUR', name: 'Euro'),
//     Currency(code: 'GBP', name: 'British Pound'),
//     Currency(code: 'INR', name: 'Indian Rupee'),
//     Currency(code: 'JPY', name: 'Japanese Yen'),
//   ];
// });


final fromCurrencyProvider = StateProvider<String?>((ref) => null);
final toCurrencyProvider = StateProvider<String?>((ref) => null);

final availableCurrenciesProvider = FutureProvider<List<Currency>>((ref) async {

  return ref.read(apiServiceProvider).fetchCurrency();
});
