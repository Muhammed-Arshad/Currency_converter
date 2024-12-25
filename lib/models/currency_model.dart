class Currency {
  final String code;
  final String name;

  Currency({required this.code, required this.name});
}


// class CurrencyRates {
//   final String date;
//   final Map<String, double> code;
//
//   CurrencyRates({required this.date, required this.code});
//
//   factory CurrencyRates.fromJson(Map<String, dynamic> json) {
//     return CurrencyRates(
//       date: json['date'],
//       code: Map<String, double>.from(json[code].map((key, value) => MapEntry(key, value.toDouble()))),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'date': date,
//       'inr': inr,
//     };
//   }
// }

