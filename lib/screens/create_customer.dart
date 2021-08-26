import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:senior_project/palette.dart';
import 'package:senior_project/screens/add_dollar_bill.dart';
import 'package:senior_project/screens/login_screen.dart';
import 'package:senior_project/shared/reused_widgets.dart';

class CreateCustomer extends StatefulWidget {
  const CreateCustomer({Key? key}) : super(key: key);

  @override
  _CreateCustomerState createState() => _CreateCustomerState();
}

class _CreateCustomerState extends State<CreateCustomer> {
  var firstname = TextEditingController();
  var lastname = TextEditingController();
  var phonenumber = TextEditingController();
  var nationality = TextEditingController();
  var address = TextEditingController();
  var gender = TextEditingController();

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
              'Register New Customer',
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
                          lblText: 'Country',
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: MaterialButton(
                          // height: size.height*0.1,
                          height: 65,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddDollarBill()));
                          },
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Next', style: kBodyText),
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
