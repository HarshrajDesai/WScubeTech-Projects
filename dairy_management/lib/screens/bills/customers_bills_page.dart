import 'package:dairy_management/widgets/bill_card.dart';
import 'package:dairy_management/widgets/sort_and_filter_bar.dart';
import 'package:flutter/material.dart';

class CustomersBillsPage extends StatelessWidget {
  const CustomersBillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Column(
        children: [
          SortAndFilterBar(),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(itemCount: 5 ,itemBuilder: (BuildContext context, int index) { 
              return BillCard(billStatus: 'null',);
             },),
          )
        ],
      ),
    );
  }
}