import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senior_project/StyleTXT.dart';
import 'package:senior_project/shared/BackgroundImage.dart';
import 'package:senior_project/screens/CreateNewUser.dart';
import 'package:senior_project/screens/ForgotPassword.dart';
import 'package:senior_project/screens/Home.dart';
import 'package:senior_project/shared/TextFormFieldWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  IconData icon = FontAwesomeIcons.solidEye;
  var username = TextEditingController();
  var password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 4,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('Money Serial Number Extraction',
                            textStyle: GoogleFonts.robotoCondensed(
                                fontSize: 55,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            speed: const Duration(milliseconds: 200),
                            cursor: '|'),
                      ],
                      totalRepeatCount: 10,
                      pause: const Duration(milliseconds: 500),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Form(
                          child: Column(
                            children: [
                              getDefaultTextFormField(
                                obscure: false,
                                iconData: FontAwesomeIcons.user,
                                lblText: 'Username',
                                txtInputAction: TextInputAction.next,
                                textEditingController: username,
                              ),
                              getDefaultTextFormField(
                                textEditingController: password,
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
                              // GestureDetector(
                              //   onTap: () {
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) =>
                              //                 ForgotPasswordScreen()));
                              //     // Navigator.pushNamed(context, "ForgotPassword");
                              //     //Get.to(ForgotPasswordScreen());
                              //   },
                              //   child: Container(
                              //     child: Row(
                              //       mainAxisAlignment: MainAxisAlignment.end,
                              //       children: [
                              //         Text(
                              //           "Forgot Password",
                              //           style: whiteStyleTXT,
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an account?",
                                      style: whiteStyleTXT),
                                  TextButton(
                                    onPressed: () {
                                      //Navigator.pushNamed(context, "CreateNewAccount");
                                      // Get.to(CreateNewAccountScreen());
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CreateNewUser()));
                                    },
                                    child: Text(
                                      "Create one",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                          height: 70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          onPressed: () async {
                            SharedPreferences pref = await SharedPreferences.getInstance();
                            pref.setBool('isLogged', true);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Login',
                                  style: buttonStyleTXT),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.login, size: 25, color: Colors.white),
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Forgot Password?", style: whiteStyleTXT),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPassword()));
                            },
                            child: Text(
                              "Click here",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}