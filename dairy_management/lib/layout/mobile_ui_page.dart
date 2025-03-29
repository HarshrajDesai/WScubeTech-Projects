import 'package:flutter/material.dart';

class MobileUiPage extends StatelessWidget {
  const MobileUiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        title: Text("M B I L E"),
      ),
      
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10),
          child: AspectRatio(
            aspectRatio: 16/9,
            child: Container(
              height: 300,
              color: Colors.deepPurple[400],
            ),
          ),),

          Expanded(child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index){
            return Padding(padding: EdgeInsets.all(10),
            child: Container(
              color: Colors.deepPurple[400],
              height: 120,
            ),);
          }))
        ],
      ),
    );
  }
}