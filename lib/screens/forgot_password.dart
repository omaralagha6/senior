import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senior_project/palette.dart';
import 'package:senior_project/screens/login_screen.dart';
import 'package:senior_project/shared/reused_widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final phoneNumber = TextEditingController();
  final pass = TextEditingController();
  final confPass = TextEditingController();

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
          //elevation: 0,
          title: AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                'Register New Password',
                textStyle: GoogleFonts.robotoCondensed(
                    fontSize: 25,
                    color: Color(0xffbfbfbf),
                    fontWeight: FontWeight.w500),
                colors: [Colors.white, Colors.grey],
                speed: const Duration(milliseconds: 200),
              ),
            ],
            totalRepeatCount: 1,
            //pause: const Duration(milliseconds: 500),
            isRepeatingAnimation: true,
          ),
          //centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          //color: Colors.black.withOpacity(0.5),
          //alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: MediaQuery.of(context).size.height / 3.5),
          // child: Column(
          //     children: [
          //   Expanded(
          //     child: SingleChildScrollView(
          child: Form(
            child: Column(children: [
              // AnimatedTextKit(
              //   animatedTexts: [
              //     ColorizeAnimatedText(
              //       'Enter phone number to reset your password',
              //       textStyle: GoogleFonts.robotoCondensed(
              //           fontSize: 30,
              //           color: Colors.white,
              //           fontWeight: FontWeight.bold),
              //       colors: [Colors.white, Colors.grey],
              //     ),
              //   ],
              //   isRepeatingAnimation: true,
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              getDefaultTextFormField(
                  obscure: false,
                  lblText: 'Phone Number',
                  txtInputAction: TextInputAction.done,
                  textEditingController: phoneNumber,
                  type: TextInputType.phone,
                  iconData: FontAwesomeIcons.phone),
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
                      Text('Send', style: kBodyText),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.send),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    ]);
    //       ),
    //     ),
    //   ],
    // );
  }
}
