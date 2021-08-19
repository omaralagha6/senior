import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:senior_project/palette.dart';
import 'package:senior_project/screens/forgot_password.dart';
import 'package:senior_project/screens/login_screen.dart';
import 'package:senior_project/shared/reused_widgets.dart';

class CreateNewAccountScreen extends StatefulWidget {
  @override
  _CreateNewAccountScreenState createState() => _CreateNewAccountScreenState();
}

class _CreateNewAccountScreenState extends State<CreateNewAccountScreen> {
  bool isObscure = true;
  var usrname = TextEditingController();
  var pass = TextEditingController();
  var firstname = TextEditingController();
  var lastname = TextEditingController();
  var phonenumber = TextEditingController();
  var nationality = TextEditingController();
  var address = TextEditingController();
  var gender = TextEditingController();

  IconData icon = FontAwesomeIcons.solidEye;

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
            elevation: 0,
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
            child: Column(children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(children: [
                      TextLiquidFill(
                        text: 'Welcome New User',
                        waveColor: Colors.white,
                        boxBackgroundColor: Colors.grey,
                        textStyle:GoogleFonts.robotoCondensed(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),
                        boxHeight: 100.0,
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                        iconData: FontAwesomeIcons.phoneAlt,
                        lblText: 'Phone Number',
                        txtInputAction: TextInputAction.next,
                        textEditingController: phonenumber,
                        type: TextInputType.phone,
                      ),
                      getDefaultTextFormField(
                        obscure: false,
                        iconData: FontAwesomeIcons.flag,
                        lblText: 'Nationality',
                        type: TextInputType.text,
                        txtInputAction: TextInputAction.next,
                        textEditingController: nationality,
                      ),
                      getDefaultTextFormField(
                        obscure: false,
                        iconData: FontAwesomeIcons.addressCard,
                        lblText: 'Address',
                        txtInputAction: TextInputAction.next,
                        type: TextInputType.text,
                        textEditingController: address,
                      ),
                      getDefaultTextFormField(
                        obscure: false,
                        iconData: FontAwesomeIcons.genderless,
                        lblText: 'Gender',
                        txtInputAction: TextInputAction.next,
                        type: TextInputType.text,
                        textEditingController: gender,
                      ),
                      getDefaultTextFormField(
                        obscure: false,
                        iconData: FontAwesomeIcons.user,
                        lblText: 'Username',
                        txtInputAction: TextInputAction.next,
                        type: TextInputType.text,
                        textEditingController: usrname,
                      ),
                      getDefaultTextFormField(
                        textEditingController: pass,
                        obscure: isObscure,
                        iconData: FontAwesomeIcons.unlock,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: MaterialButton(
                          // height: size.height*0.1,
                          height: 65,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          onPressed: () {},
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Register', style: kBoodyText),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(FontAwesomeIcons.registered),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ]),
          ),
        )
      ],
    );
  }
}
