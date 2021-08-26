import 'package:flutter/material.dart';
import 'package:senior_project/screens/create_customer.dart';
import 'package:senior_project/screens/login_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      BackGroundImage(
      image:
      "assets/100 Dollar Bills IPhone Wallpaper - IPhone Wallpapers.jpeg",
    ),
      SafeArea(child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar:AppBar(backgroundColor: Colors.transparent,),
        floatingActionButton: FloatingActionButton(
          splashColor: Colors.black26,
          child: Icon(Icons.add,
          color: Colors.white,),
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>CreateCustomer()));
          },
        ),
      ))

      ]);
  }
}
