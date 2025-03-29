import 'package:dairy_management/widgets/page_data_card.dart';
import 'package:dairy_management/widgets/sort_and_filter_bar.dart';
import 'package:flutter/material.dart';

class CustomersPage extends StatelessWidget {
  const CustomersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Column(
        children: [
          SortAndFilterBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListView.builder(itemCount: 10, itemBuilder: (BuildContext context, index){
                return PageDataCard();
              }),
            ),
          ),
        ],
      ),
    );
  }
}