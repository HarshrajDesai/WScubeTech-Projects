import 'package:flutter/material.dart';

class NotesContainer extends StatelessWidget {
  const NotesContainer({super.key, required this.title, required this.date, required this.color});
  final String title;
  final String date;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(title,style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400
            ),
            softWrap: true,
            maxLines: 3,),
          ),
          SizedBox(
            height: 5,
          ),
          Text(date)
        ],
      ),
    );
  }
}