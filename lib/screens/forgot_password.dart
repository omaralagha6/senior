import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senior_project/palette.dart';
import 'package:senior_project/screens/login_screen.dart';
import 'package:senior_project/screens/update_password_screen.dart';
import 'package:senior_project/shared/reused_widgets.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId;
  final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey();
  bool showLoading = false;

  void signnWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;
      });
      if (authCredential.user != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UpdatePasswordScreen()));
      }
    } on FirebaseAuthException catch (e) {
      // TODO
      setState(() {
        showLoading = false;
      });
      _scaffoldstate.currentState!.showSnackBar(SnackBar(
        content: Text(e.message!),
      ));
    }
  }

  getMobileFormWidget(context) {
    return Container(
      child: Form(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          getDefaultTextFormField(
              obscure: false,
              lblText: 'Phone Number',
              txtInputAction: TextInputAction.done,
              textEditingController: phoneController,
              iconData: FontAwesomeIcons.phone),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: MaterialButton(
              // height: size.height*0.1,
              height: 65,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              onPressed: () async {
                setState(() {
                  showLoading = true;
                });
                await _auth.verifyPhoneNumber(
                    phoneNumber: phoneController.text,
                    verificationCompleted: (phoneAuthCredentials) async {
                      setState(() {
                        showLoading = false;
                      });
                      //signnWithPhoneAuthCredential(phoneAuthCredentials);
                    },
                    verificationFailed: (verificationFailed) {
                      setState(() {
                        showLoading = false;
                      });
                      _scaffoldstate.currentState!.showSnackBar(
                          SnackBar(content: Text(verificationFailed.message!)));
                      //the key is replacing the context
                    },
                    codeSent: (verificationId, resendingToken) async {
                      setState(() {
                        showLoading = false;
                        currentState =
                            MobileVerificationState.SHOW_OTP_FORM_STATE;
                        this.verificationId = verificationId;
                      });
                    },
                    codeAutoRetrievalTimeout: (verifiactionId) async {});
              },
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
    );
  }

  getOtpFormWidget(context) {
    return Container(
      child: Form(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          getDefaultTextFormField(
              obscure: false,
              lblText: 'Enter Verificatiion Code',
              txtInputAction: TextInputAction.done,
              textEditingController: otpController,
              iconData: FontAwesomeIcons.code),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: MaterialButton(
              height: 65,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              onPressed: () async {
                PhoneAuthCredential phoneAuthCredential =
                    PhoneAuthProvider.credential(
                        verificationId: this.verificationId!,
                        smsCode: otpController.text);
                signnWithPhoneAuthCredential(phoneAuthCredential);
              },
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Verify', style: kBodyText),
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
    );
  }

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
            child: showLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                    ? getMobileFormWidget(context)
                    : getOtpFormWidget(context),
            padding: EdgeInsets.all(16),
          ))
    ]);
  }
}
