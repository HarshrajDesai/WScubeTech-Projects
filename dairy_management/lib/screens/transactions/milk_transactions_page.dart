import 'package:dairy_management/core/theme/app_colors.dart';
import 'package:dairy_management/core/theme/app_constants.dart';
import 'package:dairy_management/widgets/milk_transaction_card.dart';
import 'package:dairy_management/widgets/page_data_card.dart';
import 'package:dairy_management/widgets/sort_and_filter_bar.dart';
import 'package:flutter/material.dart';

class MilkTransactionsPage extends StatelessWidget {
  const MilkTransactionsPage({super.key});

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
                return MilkTransactionCard();
              }),
            ),
          ),
        ],
      ),
    );
  }
}














// Container(
//               width: 960, // Adjust width as needed
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 children: [
//                   // 🔥 Fixed Table Header (With Border Radius)
//                   ClipRRect(
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(10), // ✅ Rounded Corners (Top)
//                       topRight: Radius.circular(10),
//                     ),
//                     child: DataTable(
//                       columnSpacing: 20,
//                       showBottomBorder: true,
//                       headingRowColor: WidgetStateProperty.resolveWith(
//                         (states) => Color(0xFFCBD5E1),
//                       ),
//                       columns: [
//                         DataColumn(label: SizedBox(width: 160, child: Text("ID", style: TextStyle(fontWeight: FontWeight.bold)))),
//                         DataColumn(label: SizedBox(width: 160, child: Text("Name", style: TextStyle(fontWeight: FontWeight.bold)))),
//                         DataColumn(label: SizedBox(width: 160, child: Text("Dairy", style: TextStyle(fontWeight: FontWeight.bold)))),
//                         DataColumn(label: SizedBox(width: 160, child: Text("Cattle Type", style: TextStyle(fontWeight: FontWeight.bold)))),
//                         DataColumn(label: SizedBox(width: 160, child: Text("Status", style: TextStyle(fontWeight: FontWeight.bold)))),
//                       ],
//                       rows: const [], // No rows here, only the header
//                     ),
//                   ),
                  
//                   // 🔥 Scrollable Table Data (With Border Radius on Bottom)
//                   ClipRRect(
//                     borderRadius: const BorderRadius.only(
//                       bottomLeft: Radius.circular(10), // 
//                       bottomRight: Radius.circular(10),
//                     ),
//                     child: SizedBox(
//                       height: 50 * 5, // 5 rows * row height (50)
//                       child: Scrollbar(
//                         thumbVisibility: true,
//                         child: SingleChildScrollView(
//                           scrollDirection: Axis.vertical, // Enables Vertical Scroll
//                           child: DataTable(
//                             columnSpacing: 20,
//                             headingRowHeight: 0, // No extra header in rows
//                             dataRowColor: WidgetStateProperty.resolveWith(
//                               (states) => Colors.white
//                             ),
//                             columns: [
//                               DataColumn(label: SizedBox.shrink()), // Empty labels for alignment
//                               DataColumn(label: SizedBox.shrink()),
//                               DataColumn(label: SizedBox.shrink()),
//                               DataColumn(label: SizedBox.shrink()),
//                               DataColumn(label: SizedBox.shrink()),
//                             ],
//                             rows: List.generate(
//                               20, // More rows, but only 5 visible at a time
//                               (index) => DataRow(
//                                 cells: [
//                                   DataCell(SizedBox(width: 160, height: 50, child: Text("${index + 1}"))),
//                                   DataCell(SizedBox(width: 160, height: 50, child: Text("Hari Das"))),
//                                   DataCell(SizedBox(width: 160, height: 50, child: Text("1"))),
//                                   DataCell(SizedBox(width: 160, height: 50, child: Text("Buffalo"))),
//                                   DataCell(
//                                     SizedBox(
//                                       width: 160,
//                                       height: 50,
//                                       child: Center(
//                                         child: Container(
//                                           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                                           decoration: BoxDecoration(
//                                             color: Colors.green[100],
//                                             borderRadius: BorderRadius.circular(5),
//                                           ),
//                                           child: Text(
//                                             "Active",
//                                             style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.bold),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),