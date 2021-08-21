import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:senior_project/palette.dart';
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
  var confPass = TextEditingController();
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(children: [
                      // SizedBox(
                      //   height: 20,
                      // ),
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
                          lblText: 'Nationality',
                          txtInputAction: TextInputAction.next,
                          textEditingController: nationality,
                          submitted: () {
                            showCountryPicker(
                              context: context,
                              showPhoneCode: true,
                              // optional. Shows phone code before the country name.
                              onSelect: (Country country) {
                                nationality.text = country.name;
                                phonenumber.text = "+ ${country.phoneCode} ";
                                print('Select country: ${country.displayName}');
                              },
                            );
                          }),
                      getDefaultTextFormField(
                          obscure: false,
                          iconData: FontAwesomeIcons.phoneAlt,
                          lblText: 'Phone Number',
                          txtInputAction: TextInputAction.next,
                          textEditingController: phonenumber,
                          type: TextInputType.phone,
                          submitted: () {
                            print(phonenumber.text);
                          }),
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
                        obscure: isObscure,
                        iconData: FontAwesomeIcons.unlock,
                        lblText: 'Confirm Password',
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
                          onPressed: () {
                            if (_checkRegisterFields()) {
                              if (pass.toString() != confPass.toString()) {
                                Get.defaultDialog(
                                    middleText:
                                        "Password and confirmation should be equals.");
                              } else {}
                            } else {
                              Get.defaultDialog(
                                  middleText:
                                      "All fields are required to continue.");
                            }
                          },
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Register', style: kBodyText),
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

  bool _checkRegisterFields() {
    if (usrname.text.isEmpty ||
        pass.text.isEmpty ||
        firstname.text.isEmpty ||
        lastname.text.isEmpty ||
        phonenumber.text.isEmpty ||
        nationality.text.isEmpty ||
        address.text.isEmpty ||
        gender.text.isEmpty) return false;
    return true;
  }
}
