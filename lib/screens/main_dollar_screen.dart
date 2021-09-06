import 'package:flutter/material.dart';
import 'package:senior_project/palette.dart';
import 'package:senior_project/screens/add_dollar_bill.dart';
import 'package:senior_project/screens/login_screen.dart';

class MainDollarScreen extends StatefulWidget {
  const MainDollarScreen({Key? key}) : super(key: key);

  @override
  _MainDollarScreenState createState() => _MainDollarScreenState();
}

class _MainDollarScreenState extends State<MainDollarScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGroundImage(
          image:
              "assets/100 Dollar Bills IPhone Wallpaper - IPhone Wallpapers.jpeg",
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.lightGreen,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddDollarBill()));
              },
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightGreenAccent,
                                      Colors.white
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 200,
                                width: double.infinity,
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  "Hi",
                                  style: kBodyText,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightGreenAccent,
                                      Colors.white
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 200,
                                width: double.infinity,
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  "Hi",
                                  style: kBodyText,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightGreenAccent,
                                      Colors.white
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 200,
                                width: double.infinity,
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  "Hi",
                                  style: kBodyText,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightGreenAccent,
                                      Colors.white
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 200,
                                width: double.infinity,
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  "Hi",
                                  style: kBodyText,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightGreenAccent,
                                      Colors.white
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 200,
                                width: double.infinity,
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  "Hi",
                                  style: kBodyText,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightGreenAccent,
                                      Colors.white
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 200,
                                width: double.infinity,
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  "Hi",
                                  style: kBodyText,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightGreenAccent,
                                      Colors.white
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 200,
                                width: double.infinity,
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  "Hi",
                                  style: kBodyText,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightGreenAccent,
                                      Colors.white
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 200,
                                width: double.infinity,
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  "Hi",
                                  style: kBodyText,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightGreenAccent,
                                      Colors.white
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 200,
                                width: double.infinity,
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  "Hi",
                                  style: kBodyText,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightGreenAccent,
                                      Colors.white
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 200,
                                width: double.infinity,
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  "Hi",
                                  style: kBodyText,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightGreenAccent,
                                      Colors.white
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 200,
                                width: double.infinity,
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  "Hi",
                                  style: kBodyText,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightGreenAccent,
                                      Colors.white
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 200,
                                width: double.infinity,
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  "Hi",
                                  style: kBodyText,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightGreenAccent,
                                      Colors.white
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 200,
                                width: double.infinity,
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  "Hi",
                                  style: kBodyText,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightGreenAccent,
                                      Colors.white
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 200,
                                width: double.infinity,
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  "Hi",
                                  style: kBodyText,
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
