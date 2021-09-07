import 'package:flutter/material.dart';
import 'package:senior_project/screens/CreateDollarBill.dart';
import 'package:senior_project/shared/BackgroundImage.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({Key? key}) : super(key: key);

  @override
  _CustomerDetailsState createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
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
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              backgroundColor: Colors.transparent,
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.green.shade700,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateDollarBill()));
              },
            ),
            //body:
          ),
        ),
      ],
    );
  }
}
