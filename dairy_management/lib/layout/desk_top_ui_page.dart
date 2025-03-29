import 'package:flutter/material.dart';

class DeskTopUiPage extends StatelessWidget {
  const DeskTopUiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        title: Text("D E S K T O P"),
      ),
      
      body: Row(
        children: [
          Expanded(
            child: Column(
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
                })),
              ],
            ),
          ),
          Container(
                color: Colors.deepPurple,
                width: 200,
              )
        ],
      ),
    );
  }
}