import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier{
  final List<Map<String, dynamic>> _milkPrices = [
    {
      'milk_price': 40,
      'milk_type': 'Cow\'s Milk'
    },
    {
      'milk_price': 40,
      'milk_type': 'Buffalo\'s Milk'
    }
  ];

  List<Map<String, dynamic>> get milkPrices => _milkPrices;

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}