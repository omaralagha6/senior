import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senior_project/palette.dart';
import 'package:senior_project/screens/create_newaaccount.dart';
import 'package:senior_project/screens/forgot_password.dart';
import 'package:senior_project/shared/reused_widgets.dart';
import 'package:flutter/services.dart';

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

  static List<Color> colorizeColors = [
    // Colors.green[900],
    // Colors.green[800],
    // Colors.green[700],
    // Colors.green[600],
    // Colors.green[500],
    // Colors.green[400],
    // Colors.green[300],
    // Colors.green[200],
    // Colors.green[100],
    Colors.grey,
    Colors.white
  ];


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
                  Flexible(
                      child: Center(
                    // child:AnimatedTextKit(
                    //   animatedTexts: [
                    //     TypewriterAnimatedText(
                    //       'Money Serial Number Extraction',
                    //       textStyle: GoogleFonts.robotoCondensed(fontSize: 55,color: Colors.white,fontWeight: FontWeight.bold),
                    //       speed: const Duration(milliseconds: 500),
                    //     ),
                    //   ],
                    //
                    //   totalRepeatCount: 5,
                    //   pause: const Duration(milliseconds: 500),
                    //   displayFullTextOnTap: true,
                    //   stopPauseOnTap: true,
                    // )
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ColorizeAnimatedText(
                          'Money Serial Number Extraction',
                          textStyle:GoogleFonts.robotoCondensed(fontSize: 60,color: Colors.white,fontWeight: FontWeight.bold),
                          colors: colorizeColors,
                        ),
                      ],
                      isRepeatingAnimation: true,
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  )),
                  Expanded(
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordScreen()));
                                  // Navigator.pushNamed(context, "ForgotPassword");
                                  //Get.to(ForgotPasswordScreen());
                                },
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Forgot Password",
                                        style: kBoodyText,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: MaterialButton(
                                  height: 70,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  onPressed: () {
                                    if (username.text.isEmpty ||
                                        password.text.isEmpty) {
                                      Get.defaultDialog(
                                          middleText:
                                              "Can't leave any empty fields");
                                    }
                                  },
                                  color: Colors.blue,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Login', style: kBoodyText),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(Icons.login),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Dont't have an account ? ", style: kBoodyText),
                        TextButton(
                          onPressed: () {
                            //Navigator.pushNamed(context, "CreateNewAccount");
                            // Get.to(CreateNewAccountScreen());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CreateNewAccountScreen()));
                          },
                          child: Text(
                            "Register now",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
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

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) => LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          colors: [Colors.black54, Colors.transparent]).createShader(rect),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
          ),
        ),
      ),
    );
  }
}
