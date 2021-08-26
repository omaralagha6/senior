import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:senior_project/palette.dart';
import 'package:senior_project/screens/login_screen.dart';
import 'package:senior_project/screens/main_dollar_screen.dart';
import 'package:senior_project/shared/reused_widgets.dart';

class AddDollarBill extends StatefulWidget {
  const AddDollarBill({Key? key}) : super(key: key);

  @override
  _AddDollarBillState createState() => _AddDollarBillState();
}

class _AddDollarBillState extends State<AddDollarBill> {
  bool is1Checked = false;
  bool is2Checked = false;
  bool is5Checked = false;
  bool is10Checked = false;
  bool is20Checked = false;
  bool is50Checked = false;
  bool is100Checked = false;
  var serialNbControlller = TextEditingController();
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
                'Add Dollar Bill',
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
                          child: Container(
                            padding: EdgeInsets.all(20),
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  is1Checked ? Colors.red : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                "\$1",
                                style: TextStyle(
                                  fontSize: 100,
                                  fontFamily: "serif",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
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
                          child: Container(
                            height: 300,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  is2Checked ? Colors.red : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                "\$2",
                                style: TextStyle(
                                    fontSize: 100,
                                    fontFamily: "serif",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
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
                          child: Container(
                            height: 300,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  is5Checked ? Colors.red : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                "\$5",
                                style: TextStyle(
                                  fontSize: 100,
                                  fontFamily: "serif",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              is5Checked = false;
                              is1Checked = false;
                              is2Checked = false;
                              is10Checked = true;
                              is20Checked = false;
                              is50Checked = false;
                              is100Checked = false;
                            });
                          },
                          child: Container(
                            height: 300,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  is10Checked ? Colors.red : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                "\$10",
                                style: TextStyle(
                                    fontSize: 100,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "serif",
                                    color: Colors.white),
                              ),
                            ),
                          ),
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
                              is5Checked = false;
                              is1Checked = false;
                              is2Checked = false;
                              is10Checked = false;
                              is20Checked = true;
                              is50Checked = false;
                              is100Checked = false;
                            });
                          },
                          child: Container(
                            height: 300,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  is20Checked ? Colors.red : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                "\$20",
                                style: TextStyle(
                                  fontSize: 100,
                                  fontFamily: "serif",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              is5Checked = false;
                              is1Checked = false;
                              is2Checked = false;
                              is10Checked = false;
                              is20Checked = false;
                              is50Checked = true;
                              is100Checked = false;
                            });
                          },
                          child: Container(
                            height: 300,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  is50Checked ? Colors.red : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                "\$50",
                                style: TextStyle(
                                    fontSize: 100,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "serif",
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        is5Checked = false;
                        is1Checked = false;
                        is2Checked = false;
                        is10Checked = false;
                        is20Checked = false;
                        is50Checked = false;
                        is100Checked = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: is100Checked ? Colors.red : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          "\$100",
                          style: TextStyle(
                            fontSize: 100,
                            fontFamily: "serif",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  getDefaultTextFormField(
                    lblText: 'Serial Number',
                    textEditingController: serialNbControlller,
                    txtInputAction: TextInputAction.next,
                    obscure: false,
                    iconData2: IconButton(
                        icon: Icon(FontAwesomeIcons.camera),
                        onPressed: () async{
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
                    onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) =>MainDollarScreen()));},
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
                  )
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
    _text="";

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
        serialNbControlller.text=s;
        break;
      }
    }
    print(_text);

    //print(serials);
    //serialNbControlller.text = serials!;

  }
}
