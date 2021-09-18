import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:random_color/random_color.dart';
import 'package:senior_project/StyleTXT.dart';
import 'package:senior_project/screens/CustomerInfo.dart';
import 'package:senior_project/shared/BackgroundImage.dart';

class SearchCustomer extends StatefulWidget {
  final String userId;

  SearchCustomer({required this.userId});

  @override
  _SearchCustomerState createState() => _SearchCustomerState();
}

class _SearchCustomerState extends State<SearchCustomer> {
  CollectionReference searchCust =
      FirebaseFirestore.instance.collection("Bills-Users-Customers");
  String searchString = "";
  var searchController = TextEditingController();

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
          body: Column(children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.grey[300]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextFormField(
                        controller: searchController,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20),
                            child: IconButton(
                              icon:Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                              color: Colors.white,
                            ),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            ),

                          ),
                          hintText: "Search Serial Number",
                          hintStyle: whiteStyleTXT,

                        ),
                        style: whiteStyleTXT,
                        onChanged: (value){
                          setState(() {
                            searchString=value;
                          });
                        },
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: (searchString.isEmpty)
                          ? searchCust
                              .where("UserId", isEqualTo: widget.userId)
                              .snapshots()
                          : searchCust
                              .where("Search Index",
                                  arrayContains: searchString)
                              .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        RandomColor _randomColor = RandomColor();
                        ColorHue _green = ColorHue.custom(Range(80, 90));
                        Color _color =
                            _randomColor.randomColor(colorHue: _green);
                        if (snapshot.hasError) {
                          return Text("We got an error ${snapshot.error}");
                        }
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return SizedBox(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          case ConnectionState.none:
                            return Text("No Data is present");

                          case ConnectionState.done:
                            return Text("We Are Done");
                          default:
                            return new ListView(
                                children: snapshot.data!.docs
                                    .map((DocumentSnapshot document) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blueGrey.withOpacity(0.5),
                                ),
                                margin: EdgeInsets.all(8),
                                padding: EdgeInsets.all(8),
                                child: new ListTile(
                                  onTap: () async {
                                    DocumentSnapshot cust =
                                        await FirebaseFirestore.instance
                                            .collection("Users")
                                            .doc(widget.userId)
                                            .collection("Customers")
                                            .doc(document["CustId"])
                                            .get();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CustomerInfo(
                                                  userId: widget.userId,
                                                  customer: cust,
                                                )));
                                  },
                                  title: Text(
                                    document["Serial Number"],
                                    style: whiteStyleTXT,
                                  ),
                                ),
                              );
                            }).toList());
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      )
    ]);
  }
}
