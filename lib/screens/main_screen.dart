import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:random_color/random_color.dart';
import 'package:senior_project/screens/create_customer.dart';
import 'package:senior_project/screens/login_screen.dart';
import 'package:senior_project/screens/main_dollar_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
            backgroundColor:Colors.transparent,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightGreen,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateCustomer()));
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

                  Color _color =
                      _randomColor.randomColor(colorHue: ColorHue.green);
                  return GestureDetector(
                    onTap:(){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>MainDollarScreen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: _color,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            imageList[index],
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
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
