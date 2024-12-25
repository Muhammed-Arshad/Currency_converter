import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final conversionProvider = StateNotifierProvider<ConversionNotifier, double>((ref) {
  return ConversionNotifier(ref);
});

class ConversionNotifier extends StateNotifier<double> {
  final Ref ref;

  ConversionNotifier(this.ref) : super(0.0);

  Future<void> convertCurrency(String from, String to, double amount) async {

    try {
      final rates = await ref.read(apiServiceProvider).fetchExchangeRates(from);


      if (rates.containsKey(to)) {
        state = rates[to]! * amount;
      } else {
        state = 0.0;
      }
    } catch (e) {
      state = 0.0;
    }
  }
}
