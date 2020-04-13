import 'dart:ffi';

import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'dart:convert';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'GBP';
  double rate;

  DropdownButton<String> getDropdownAndroid() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      style: TextStyle(color: Colors.white),
      onChanged: (String newValue) {
        setState(() {
          selectedCurrency = newValue;
          print(selectedCurrency);
        });
      },
      items: dropdownItems,
    );
  }

  CupertinoPicker pickerIOS() {
    List<Text> pickerItems = [];

    for (String currency in currenciesList) {
      var newItem = Text(currency);
      pickerItems.add(newItem);
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      children: pickerItems,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print("Chosen currency --> ${currenciesList[selectedIndex]}");
        getExchange('BTC', currenciesList[selectedIndex]);
      },
    );
  }

  void getExchange(String crypto, String fiat) async {
    print("Entered exchaneg function with $crypto and $fiat");
    final response = await http.get(
        'https://rest.coinapi.io/v1/exchangerate/$crypto/$fiat?apikey=39FEEC17-D20A-4A09-9989-6B5DEC8AD59C');

    if (response.statusCode == 200) {
      setState(() {
        rate = double.parse(
            (json.decode(response.body)['rate']).toStringAsFixed(2));
        selectedCurrency = fiat;
      });
    } else {
      throw Exception('Failed to get exchange rate');
    }
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
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 LTC = $rate $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = $rate $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = $rate $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? pickerIOS() : getDropdownAndroid(),
          )
        ],
      ),
    );
  }
}
