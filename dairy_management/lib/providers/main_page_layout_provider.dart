import 'package:dairy_management/screens/bills/customers_bills_page.dart';
import 'package:dairy_management/screens/customers/customers_page.dart';
import 'package:dairy_management/screens/home/home_page.dart';
import 'package:dairy_management/screens/transactions/milk_transactions_page.dart';
import 'package:flutter/cupertino.dart';

class MainPageLayoutProvider extends ChangeNotifier{

  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  Widget getRequiredPage(int index){
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return MilkTransactionsPage();
      case 2:
        return CustomersPage();
      case 3:
        return CustomersBillsPage();
      default:
        return HomePage();
    }
    
  }
 
  void updatePageIndex(int index){
    _pageIndex = index;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}