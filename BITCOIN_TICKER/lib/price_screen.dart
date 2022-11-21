import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  int rate;
  bool isWaiting = true;

  DropdownButton<String> getAndroidDropdown() {
    List<DropdownMenuItem<String>> dropDownItemsList = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );

      dropDownItemsList.add(newItem);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItemsList,
      onChanged: ((value) {
        setState(() {
          getData();
          selectedCurrency = value;
        });
      }),
    );
  }

  CupertinoPicker getIosPicker() {
    List<Widget> pickerItems = [];
    for (String currency in currenciesList) {
      var newCurrency = Text(currency);
      pickerItems.add(newCurrency);
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          getData();
          selectedCurrency = currenciesList.elementAt(selectedIndex);
        });
      },
      children: pickerItems,
    );
  }

  Map<String, String> cryptoData = {};
  void getData() async {
    try {
      var data = await CoinData().getBitcoinRate(selectedCurrency);
      setState(() {
        cryptoData = data;
        isWaiting = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              CryptoCard(
                cryptoCurrency: 'BTC',
                value: isWaiting ? '?' : cryptoData['BTC'],
                selectedCurrency: selectedCurrency,
              ),
              CryptoCard(
                cryptoCurrency: 'ETH',
                value: isWaiting ? '?' : cryptoData['ETH'],
                selectedCurrency: selectedCurrency,
              ),
              CryptoCard(
                cryptoCurrency: 'LTC',
                value: isWaiting ? '?' : cryptoData['LTC'],
                selectedCurrency: selectedCurrency,
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: 150.0,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Center(
              child: Platform.isAndroid ? getAndroidDropdown() : getIosPicker(),
            ),
          ),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  String cryptoCurrency;
  String value;
  String selectedCurrency;

  CryptoCard({this.cryptoCurrency, this.value, this.selectedCurrency});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCurrency = $value $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
