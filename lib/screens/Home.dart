import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:random_color/random_color.dart';
import 'package:senior_project/screens/CreateNewCustomer.dart';
import 'package:senior_project/screens/CustomerDetails.dart';
import 'package:senior_project/screens/UpdateCustomer.dart';
import 'package:senior_project/shared/BackgroundImage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../StyleTXT.dart';
import 'Login.dart';

class HomeScreen extends StatefulWidget {
   final String userId;
  HomeScreen( {required this.userId});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  late var id = widget.userId;
  CollectionReference userRef=FirebaseFirestore.instance.collection("Users");


  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
                    SharedPreferences pref = await SharedPreferences.getInstance();
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
                          CreateNewCustomer(userId: id,)));
            },
          ),
          body: Container(
            margin: EdgeInsets.all(12),
            child: StreamBuilder(
              stream: userRef.doc(id).collection("Customers").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
                return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 12,
                    itemCount: snapshot.hasData?snapshot.data!.docs.length:0,
                    itemBuilder: (context, index) {
                      RandomColor _randomColor = RandomColor();
                      ColorHue _green = ColorHue.custom(Range(80, 90));
                      Color _color = _randomColor.randomColor(colorHue: _green);
                      return GestureDetector(
                        onLongPress: (){
                          snapshot.data!.docs[index].reference.delete();
                        },
                        onDoubleTap: (){
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor:Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                  ),
                                  content:Container(
                                    height: 150,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Full Name : "+ snapshot.data!.docs[index]["First Name"]+" "+snapshot.data!.docs[index]["Last Name"],style: customerDetailStyleTXT,),
                                        Text("Phone Number : "+snapshot.data!.docs[index]["Phone Number"],style: customerDetailStyleTXT),
                                        Text("Gender : "+snapshot.data!.docs[index]["Gender"],style: customerDetailStyleTXT),
                                        Text("Country : "+snapshot.data!.docs[index]["Country"],style: customerDetailStyleTXT),
                                        Text("Address : "+snapshot.data!.docs[index]["Address"],style: customerDetailStyleTXT),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK")),
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UpdateCustomer(customer: snapshot.data!.docs[index])));
                                        },
                                        child: Text("Edit")),
                                  ],
                                );
                              });
                        },
                        onTap: () {
                          print(snapshot.data!.docs[index].id);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomerDetails(userId: id,custId: snapshot.data!.docs[index].id,)));
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
                                  snapshot.data!.docs[index]["First Name"]+" "+snapshot.data!.docs[index]["Last Name"],
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
                    });
              }
            ),
          ),
        ),
      ),
    ]);
  }
}
