import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: Myapp(),));
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 30,left: 25),
              child: Text("Table",
                style: TextStyle(
                    color: Colors.red,fontWeight: FontWeight.bold,fontSize: 40),),
            ),
            Container(
              margin: const EdgeInsets.only(left: 650),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Text("Row1 Col1"),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Text("Row1 Col2"),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Text("Row1 Col3"),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 650),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Text("Row2 Col1"),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Text("Row2 Col2"),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Text("Row2 Col3"),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 650),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Text("Row3 Col1"),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Text("Row3 Col2"),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Text("Row3 Col3"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }}
