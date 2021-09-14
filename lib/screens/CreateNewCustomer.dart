import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:senior_project/Models/Customer.dart';
import 'package:senior_project/screens/Home.dart';
import 'package:senior_project/shared/BackgroundImage.dart';
import 'package:senior_project/shared/TextFormFieldWidget.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../StyleTXT.dart';

class CreateNewCustomer extends StatefulWidget {
  final String userId;

  CreateNewCustomer({required this.userId});

  @override
  _CreateNewCustomerState createState() => _CreateNewCustomerState();
}

class _CreateNewCustomerState extends State<CreateNewCustomer> {
  var firstname = TextEditingController();
  var lastname = TextEditingController();
  var phoneNbr = TextEditingController();
  var nationality = TextEditingController();
  var address = TextEditingController();
  var gender = TextEditingController();
  late String id = widget.userId;
  CollectionReference userRef = FirebaseFirestore.instance.collection("Users");

  _CreateNewCustomerState();

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Stack(
      children: [
        BackGroundImage(
            image:
                "assets/100 Dollar Bills IPhone Wallpaper - IPhone Wallpapers.jpeg"),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            //toolbarHeight: 80,
            //elevation: 10,
            title: Text(
              'Create Customer',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: "serif",
                  fontSize: 30,
                  color: Color(0xffbfbfbf)),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Form(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              getDefaultTextFormField(
                                  obscure: false,
                                  lblText: 'First Name',
                                  txtInputAction: TextInputAction.next,
                                  textEditingController: firstname,
                                  type: TextInputType.text,
                                  iconData: FontAwesomeIcons.user),
                              getDefaultTextFormField(
                                obscure: false,
                                iconData: FontAwesomeIcons.user,
                                lblText: 'Last Name',
                                txtInputAction: TextInputAction.next,
                                textEditingController: lastname,
                                type: TextInputType.text,
                              ),
                              getDefaultTextFormField(
                                  obscure: false,
                                  iconData: FontAwesomeIcons.flag,
                                  lblText: 'Country',
                                  txtInputAction: TextInputAction.next,
                                  textEditingController: nationality,
                                  submitted: () {
                                    showCountryPicker(
                                      context: context,
                                      showPhoneCode: true,
                                      // optional. Shows phone code before the country name.
                                      onSelect: (Country country) {
                                        nationality.text = country.name;
                                        phoneNbr.text = "+${country.phoneCode}";
                                        print(
                                            'Select country: ${country.displayName}');
                                      },
                                    );
                                  }),
                              getDefaultTextFormField(
                                  obscure: false,
                                  iconData: FontAwesomeIcons.phoneAlt,
                                  lblText: 'Phone Number',
                                  txtInputAction: TextInputAction.next,
                                  textEditingController: phoneNbr,
                                  type: TextInputType.phone,
                                  submitted: () {
                                    print(phoneNbr.text);
                                  }),
                              getDefaultTextFormField(
                                obscure: false,
                                iconData: FontAwesomeIcons.addressCard,
                                lblText: 'Address',
                                txtInputAction: TextInputAction.next,
                                type: TextInputType.text,
                                textEditingController: address,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  height: 65,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300]!.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    children: [
                                      Text("Gender" ,style:whiteStyleTXT),
                                      Radio(
                                        value: "Male",
                                        groupValue: gender.text,
                                        onChanged: (value){
                                          setState(() {
                                            gender.text=value as String ;
                                          });
                                        },
                                      ),Text("Male",style:whiteStyleTXT),
                                      Radio(
                                        value: "Female",
                                        groupValue: gender.text,
                                        onChanged: (value){
                                          setState(() {
                                            gender.text=value as String ;
                                          });
                                        },
                                      ),Text("Female",style:whiteStyleTXT),
                                    ],
                                  ),
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: MaterialButton(
                    // height: size.height*0.1,
                    height: 65,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    onPressed: () async {
                      // Navigator.pop(context);
                      if (_checkRegisterFields() == true) {
                      final result= await Connectivity().checkConnectivity();
                      if(result== ConnectivityResult.wifi || result ==ConnectivityResult.mobile)
                        {
                          userRef
                              .doc(id)
                              .collection("Customers")
                              .where("Phone Number", isEqualTo: phoneNbr.text)
                              .get()
                              .then((value) {
                            if (value.docs.length == 0) {
                              Customer c = Customer(
                                  firstname: firstname.text,
                                  lastname: lastname.text,
                                  country: nationality.text,
                                  phonenumber: phoneNbr.text,
                                  address: address.text,
                                  gender: gender.text);
                              userRef
                                  .doc(id)
                                  .collection("Customers")
                                  .add({
                                "First Name": c.firstname,
                                "Last Name": c.lastname,
                                "Country": c.country,
                                "Phone Number": c.phonenumber,
                                "Address": c.address,
                                "Gender": c.gender,
                              })
                                  .whenComplete(() => Navigator.pop(context))
                                  .catchError((onError) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                        Text("${onError.toString()}")));
                              });
                            } else {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(12)),
                                      title: Text("Existing Customer"),
                                      content:
                                      Text("This customer  already exist"),
                                      actions: [
                                        FlatButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("OK")),
                                      ],
                                    );
                                  });
                            }
                          });

                        }
                      else
                        {
                          showTopSnackBar(
                            context,
                            CustomSnackBar.error(
                              message:
                              "You don't have internet access",
                            ),
                          );
                        }
                      } else {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                content: Text("Can't keep an empty field"),
                                actions: [
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK")),
                                ],
                              );
                            });
                      }
                    },
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Create', style: buttonStyleTXT),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.person_add_outlined,
                            size: 25, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  bool _checkRegisterFields() {
    if (firstname.text.isEmpty ||
        lastname.text.isEmpty ||
        phoneNbr.text.isEmpty ||
        nationality.text.isEmpty ||
        address.text.isEmpty ||
        gender.text.isEmpty) return false;
    return true;
  }
}
