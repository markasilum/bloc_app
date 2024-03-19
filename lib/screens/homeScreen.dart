import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Container(
            padding: EdgeInsets.all(100),
            color: Colors.amber[100],
            width: screenSize.width*.35,
            height: screenSize.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("JUST LIKE HOME BUT BETTER", style: TextStyle(fontSize: 60, fontWeight: FontWeight.w600),  ),
              Text(
                  "Bahala na is the restaurant to end all debates of where to dine and have a greate time.", style: TextStyle(fontSize: 25),),
            ]),
          ),
          Expanded(
              child: Container(
            color: Colors.pink[100],
          ))
        ],
      ),
    );
  }
}
