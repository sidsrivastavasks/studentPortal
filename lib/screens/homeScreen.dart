import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Center(
          child: Container(
            child: Text("HomeScreen"),
          ),
        ),
      ),
    );
  }
}
