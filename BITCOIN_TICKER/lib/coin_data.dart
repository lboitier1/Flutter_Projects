import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR',
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate/';
const apiKey = '41C88A7A-6089-43D8-BC48-B472DA1BA6DF';

class CoinData {
  Future getBitcoinRate(String currency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      var response = await http.get(Uri.parse('${coinAPIURL}$crypto/$currency?apikey=$apiKey'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var lastPrice = data['rate'].round();
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        return 0;
      }
    }
    return cryptoPrices;
  }
}
