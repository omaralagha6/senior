import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senior_project/palette.dart';
import 'package:senior_project/screens/login_screen.dart';
import 'package:senior_project/shared/reused_widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  var phonenumber = TextEditingController();

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
            title: Text('Forgot Password'),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            backgroundColor: Colors.transparent,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      child: Column(children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            WavyAnimatedText('Enter your phone number to reset your password',textStyle:GoogleFonts.robotoCondensed(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold) ),
                          ],
                          isRepeatingAnimation: true,
                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        getDefaultTextFormField(
                            obscure: false,
                            lblText: 'Phone Number',
                            txtInputAction: TextInputAction.done,
                            textEditingController: phonenumber,
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
                                Text('Send', style: kBoodyText),
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
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
