import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/currency_model.dart';

class ApiService {
  static const String _baseUrl = 'https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/';

  Future<T> fetchData<T>(String endpoint, T Function(Map<String, dynamic>) parseData) async {
    final response = await http.get(Uri.parse('$_baseUrl$endpoint'));

    if (response.statusCode == 200) {
      // print(response.body);
      final Map<String, dynamic> data = json.decode(response.body);
      return parseData(data);
    } else {
      throw Exception('Failed to load data from $endpoint');
    }
  }

  // Fetch exchange rates for a specific base currency
  Future<Map<String, double>> fetchExchangeRates(String baseCurrency) async {
    return fetchData<Map<String, double>>(
      'currencies/$baseCurrency.json',
       // currencies/inr.json
          (data) {

        return Map<String, double>.from(data[baseCurrency].map((key, value)
          => MapEntry(key, value.toDouble())));
      },
    );
  }

  // Fetch list of available currencies
  Future<List<Currency>> fetchCurrency() async {
    return fetchData<List<Currency>>(
      'currencies.json',
          (data) {
        return data.entries.map((entry)
          => Currency(code: entry.key, name: entry.value))
            .toList();
      },
    );
  }
}
