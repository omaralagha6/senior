import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:random_color/random_color.dart';
import 'package:senior_project/screens/CreateNewCustomer.dart';
import 'package:senior_project/screens/CustomerDetails.dart';
import 'package:senior_project/shared/BackgroundImage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../StyleTXT.dart';
import 'Login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imageList = [
    'omar',
    'mohamad',
    'ahmad',
    'omar',
    'mohamad',
    'ahmad',
    'omar',
    'mohamad',
    'ahmad',
    'omar',
    'mohamad',
    'ahmad',
    'omar',
    'mohamad',
    'ahmad'
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackGroundImage(
        image:
            "assets/100 Dollar Bills IPhone Wallpaper - IPhone Wallpapers.jpeg",
      ),
      SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'Home Page',
              style: titleStyleTXT,
            ),
            actions: [
              Container(
                width: 100,
                child: IconButton(
                  onPressed: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setBool('isLogged', false);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Logout",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: "serif",
                              color: Colors.white)),
                      Icon(Icons.logout),
                    ],
                  ),
                ),
              ),
            ],
            backgroundColor: Colors.transparent,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green.shade700,
            child: Icon(
              Icons.add,
              size: 40,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CreateNewCustomer(/*prev: context,*/)));
            },
          ),
          body: Container(
            margin: EdgeInsets.all(12),
            child: StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  RandomColor _randomColor = RandomColor();
                  ColorHue _green = ColorHue.custom(Range(80, 90));
                  Color _color = _randomColor.randomColor(colorHue: _green);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomerDetails()));
                    },
                    child: Shimmer(
                      child: Container(
                        decoration: BoxDecoration(
                            color: _color.withOpacity(0.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              imageList[index],
                              style: customerStyleTXT,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (index) {
                  return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
                }),
          ),
        ),
      ),
    ]);
  }
}
