import 'package:flutter/material.dart';

class page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selam Admin"),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text("Geri Dön"),
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/LoginPage');
            },
          ),
        ],
      ),
    );
  }
}
