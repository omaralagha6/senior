import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:senior_project/screens/CustomerDetails.dart';
import 'package:senior_project/shared/BackgroundImage.dart';
import 'package:senior_project/shared/TextFormFieldWidget.dart';

import '../StyleTXT.dart';

class CreateDollarBill extends StatefulWidget {
  const CreateDollarBill({Key? key}) : super(key: key);

  @override
  _CreateDollarBillState createState() => _CreateDollarBillState();
}

class _CreateDollarBillState extends State<CreateDollarBill> {
  bool is1Checked = false;
  bool is2Checked = false;
  bool is5Checked = false;
  bool is10Checked = false;
  bool is20Checked = false;
  bool is50Checked = false;
  bool is100Checked = false;
  var serialNbController = TextEditingController();
  String _text = '';
  late PickedFile _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackGroundImage(
          image:
              "assets/100 Dollar Bills IPhone Wallpaper - IPhone Wallpapers.jpeg"),
      SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              //toolbarHeight: 80,
              //elevation: 10,
              title: Text(
                'Create Dollar Bill',
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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              is1Checked = true;
                              is2Checked = false;
                              is5Checked = false;
                              is10Checked = false;
                              is20Checked = false;
                              is50Checked = false;
                              is100Checked = false;
                            });
                          },
                          child:
                              _dollarChecked(isChecked: is1Checked, value: 1),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              is2Checked = true;
                              is1Checked = false;
                              is5Checked = false;
                              is10Checked = false;
                              is20Checked = false;
                              is50Checked = false;
                              is100Checked = false;
                            });
                          },
                          child:
                              _dollarChecked(isChecked: is2Checked, value: 2),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              is5Checked = true;
                              is1Checked = false;
                              is2Checked = false;
                              is10Checked = false;
                              is20Checked = false;
                              is50Checked = false;
                              is100Checked = false;
                            });
                          },
                          child:
                              _dollarChecked(isChecked: is5Checked, value: 5),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              is10Checked = true;
                              is1Checked = false;
                              is2Checked = false;
                              is5Checked = false;
                              is20Checked = false;
                              is50Checked = false;
                              is100Checked = false;
                            });
                          },
                          child:
                              _dollarChecked(isChecked: is10Checked, value: 10),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              is20Checked = true;
                              is1Checked = false;
                              is2Checked = false;
                              is5Checked = false;
                              is10Checked = false;
                              is50Checked = false;
                              is100Checked = false;
                            });
                          },
                          child:
                              _dollarChecked(isChecked: is20Checked, value: 20),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              is50Checked = true;
                              is1Checked = false;
                              is2Checked = false;
                              is5Checked = false;
                              is10Checked = false;
                              is20Checked = false;
                              is100Checked = false;
                            });
                          },
                          child:
                              _dollarChecked(isChecked: is50Checked, value: 50),
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        is100Checked = true;
                        is1Checked = false;
                        is2Checked = false;
                        is5Checked = false;
                        is10Checked = false;
                        is20Checked = false;
                        is50Checked = false;
                      });
                    },
                    child: _dollarChecked(isChecked: is100Checked, value: 100),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        getDefaultTextFormField(
                          lblText: 'Serial Number',
                          textEditingController: serialNbController,
                          txtInputAction: TextInputAction.next,
                          obscure: false,
                          iconData2: IconButton(
                              icon: Icon(FontAwesomeIcons.camera),
                              onPressed: () async {
                                await getSerialNumber();
                              }),
                          iconData: FontAwesomeIcons.dollarSign,
                        ),
                        MaterialButton(
                          // height: size.height*0.1,
                          height: 65,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CustomerDetails()));
                          },
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Create', style: buttonStyleTXT),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.app_registration,
                                  color: Colors.white, size: 25),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      )
    ]);
  }

  Future getSerialNumber() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = pickedFile;
      } else {
        print("No image selected");
      }
    });
    CircularProgressIndicator();
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(File(_image.path));
    final TextRecognizer textRecognizer =
        FirebaseVision.instance.textRecognizer();
    final VisionText visionText =
        await textRecognizer.processImage(visionImage);
    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        _text += (line.text! + '\n');
      }
    }
    print(_text);
    List<String> str = _text.split("\n");
    _text = "";

    final regExp = RegExp(
        r'^([A-Z])([A-Z])(\s)([0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])(\s)([A-Z])$');
    final regExp1 = RegExp(
        r'^([A-Z])([A-Z])\s([0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])([A-Z])$');
    final regExp2 = RegExp(
        r'^([A-Z])([A-Z])([0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])\s([A-Z])$');
    final regExp3 = RegExp(
        r'^([A-Z])([A-Z])([0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])([A-Z])$');
    final regExp4 = RegExp(
        r'^([A-Z])(\s)([0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])(\s)([A-Z])$');
    final regExp5 =
        RegExp(r'^([A-Z])([0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])([A-Z])$');
    final regExp6 = RegExp(
        r'^([A-Z])(\s)([0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])([A-Z])$');
    final regExp7 = RegExp(
        r'^([A-Z])([0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])(\s)([A-Z])$');
    //String? serials=null;
    for (String s in str) {
      if (regExp.hasMatch(s) ||
          regExp1.hasMatch(s) ||
          regExp2.hasMatch(s) ||
          regExp3.hasMatch(s) ||
          regExp4.hasMatch(s) ||
          regExp5.hasMatch(s) ||
          regExp6.hasMatch(s) ||
          regExp7.hasMatch(s)) {
        serialNbController.text = s;
        break;
      }
    }
    print(_text);

    //print(serials);
    //serialNbControlller.text = serials!;
  }

  Widget _dollarChecked({required bool isChecked, required int value}) {
    return Container(
      //width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:
            isChecked ? Color(0xff00741d).withOpacity(0.7) : Colors.transparent,
      ),
      child: Center(
        child: Text(
          "\$$value",
          style: TextStyle(
            fontSize: 100,
            fontFamily: "serif",
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
