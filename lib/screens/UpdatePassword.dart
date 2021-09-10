import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:senior_project/StyleTXT.dart';
import 'package:senior_project/shared/BackgroundImage.dart';
import 'package:senior_project/screens/Home.dart';
import 'package:senior_project/shared/TextFormFieldWidget.dart';

class UpdatePassword extends StatefulWidget {
  final String userId;
  UpdatePassword( {required this.userId});

  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  bool isObscure = true;
  bool isObscure2 = true;
  late String id=widget.userId;
  IconData icon = FontAwesomeIcons.solidEye;
  IconData icon2 = FontAwesomeIcons.solidEye;
  var pass = TextEditingController();
  var confPass = TextEditingController();
  CollectionReference userRef=FirebaseFirestore.instance.collection("Users");

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Stack(children: [
      BackGroundImage(
          image:
              "assets/100 Dollar Bills IPhone Wallpaper - IPhone Wallpapers.jpeg"),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            //toolbarHeight: 80,
            //elevation: 10,
            title: Text(
              'Register New User',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getDefaultTextFormField(
                textEditingController: pass,
                obscure: isObscure,
                iconData: FontAwesomeIcons.lock,
                lblText: 'Password',
                txtInputAction: TextInputAction.done,
                iconData2: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                      if (isObscure == true) {
                        icon = FontAwesomeIcons.solidEye;
                      } else {
                        icon = FontAwesomeIcons.solidEyeSlash;
                      }
                    });
                  },
                  icon: Icon(
                    icon,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              getDefaultTextFormField(
                textEditingController: confPass,
                obscure: isObscure2,
                iconData: FontAwesomeIcons.unlock,
                lblText: 'Confirm Password',
                txtInputAction: TextInputAction.done,
                iconData2: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure2 = !isObscure2;
                      if (isObscure2 == true) {
                        icon2 = FontAwesomeIcons.solidEye;
                      } else {
                        icon2 = FontAwesomeIcons.solidEyeSlash;
                      }
                    });
                  },
                  icon: Icon(
                    icon2,
                    size: 30,
                    color: Colors.white,
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
                  onPressed: () {
                    if(pass.text.isEmpty || confPass.text.isEmpty)
                      {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                ),
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
                    else {
                      if (pass.text != confPass.text) {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                content: Text(
                                    "Password and Confirm password do not match"),
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
                      else
                        {
                          userRef.doc(id).update({
                            "Password":pass.text
                          }).whenComplete(() => Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>HomeScreen(userId: id,))));
                        }
                    }
                  },
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Register', style: whiteStyleTXT),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.app_registration_outlined)
                    ],
                  ),
                ),
              )
            ],
          ))
    ]);
  }
}
