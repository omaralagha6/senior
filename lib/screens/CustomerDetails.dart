import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:random_color/random_color.dart';
import 'package:senior_project/StyleTXT.dart';
import 'package:senior_project/screens/CreateDollarBill.dart';
import 'package:senior_project/shared/BackgroundImage.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CustomerDetails extends StatefulWidget {
  final String userId;
  final String custId;

  CustomerDetails({required this.userId, required this.custId});

  @override
  _CustomerDetailsState createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  late String uid = widget.userId;
  late String cid = widget.custId;
  CollectionReference userRef = FirebaseFirestore.instance.collection("Users");

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
                          builder: (context) => CreateDollarBill(
                                userId: uid,
                                custId: cid,
                              )));
                },
              ),
              body: StreamBuilder(
                stream: userRef
                    .doc(uid)
                    .collection("Customers")
                    .doc(cid)
                    .collection("Dollar Bills")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  RandomColor _randomColor = RandomColor();
                  ColorHue _green = ColorHue.custom(Range(80, 90));
                  Color _color = _randomColor.randomColor(colorHue: _green);
                  return ListView.builder(
                      itemCount:
                          snapshot.hasData ? snapshot.data!.docs.length : 0,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                            child: GestureDetector(
                          onLongPress: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    content: Container(
                                      height: 120,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons
                                                .exclamationTriangle,
                                            size: 55,
                                            color: Colors.yellow,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                              "Are You Sure you want to delete this bill?",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic,
                                                fontFamily: "serif",
                                              )),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cancel")),
                                      FlatButton(
                                          onPressed: () async {
                                            final result = await Connectivity()
                                                .checkConnectivity();
                                            if (result ==
                                                    ConnectivityResult.wifi ||
                                                result ==
                                                    ConnectivityResult.mobile) {
                                              snapshot
                                                  .data!.docs[index].reference
                                                  .delete()
                                                  .whenComplete(() =>
                                                      Navigator.pop(context));
                                            } else {
                                              showTopSnackBar(
                                                context,
                                                CustomSnackBar.error(
                                                  message:
                                                      "You don't have internet access",
                                                ),
                                              );
                                            }
                                          },
                                          child: Text("OK")),
                                    ],
                                  );
                                });
                          },
                          child: Container(
                            height: 150,
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.transparent,
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/${snapshot.data!.docs[index]["Amount"]}dollarbill.jpg"),
                                  fit: BoxFit.fill,
                                  colorFilter: ColorFilter.mode(
                                      Colors.black45, BlendMode.darken),
                                )),
                            child: Shimmer(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Amount : " +
                                        snapshot.data!.docs[index]["Amount"],
                                    style: dollarDetailsTXT,
                                  ),
                                  Text(
                                    "Reserve Bank : " +
                                        snapshot.data!.docs[index]
                                            ["Reserve Bank"],
                                    style: dollarDetailsTXT,
                                  ),
                                  Text(
                                    "Serial Number : " +
                                        snapshot.data!.docs[index]
                                            ["Serial Number"],
                                    style: dollarDetailsTXT,
                                  ),
                                  Text(
                                    "Series Year : " +
                                        snapshot.data!.docs[index]
                                            ["Series Year"],
                                    style: dollarDetailsTXT,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                      });
                },
              )),
        )
      ],
    );
  }
}
