import 'package:flutter/material.dart';

class MainDollarScreen extends StatefulWidget {
  const MainDollarScreen({Key? key}) : super(key: key);

  @override
  _MainDollarScreenState createState() => _MainDollarScreenState();
}

class _MainDollarScreenState extends State<MainDollarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("MAinDollar Screen"),
      ),
    );
  }
}
