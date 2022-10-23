import 'dart:convert';
import 'package:coinbase_clone/models/coin.dart';
import 'package:coinbase_clone/models/data_error.dart';
import 'package:http/http.dart' as http;

class CoinRepository {
  static const String _baseUrl = 'https://min-api.cryptocompare.com/';

  static Future<List<Coin>> getCoins() async {
    const requestUrl = '${_baseUrl}data/top/totalvolfull?limit=25&tsym=USD&page=0';

    try {
      final response = await http.Client().get(Uri.parse(requestUrl));

      /// Checking the status code of the response. If it is 200, it is decoding the response body and
      /// returning a list of Coin objects.
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        final data = json['Data'] as List<dynamic>;

        /// Mapping the data to Coin objects.
        return data.map((e) {
          /// Mapping the data that comes from JSON to Coin objects.
          return Coin.fromMap(e);
        }).toList();
      } else {
        throw Exception('Failed to load currencies');
      }
    } catch (err) {
      throw DataError(message: err.toString());
    }
  }
}
