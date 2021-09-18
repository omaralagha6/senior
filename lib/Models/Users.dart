import 'package:senior_project/Models/Person.dart';

class Users extends Person{
  final String firstname,
      lastname,
      country,
      phonenumber,
      address,
      gender,
      username,
      password;

  Users(
      {required this.firstname,
      required this.lastname,
      required this.country,
      required this.phonenumber,
      required this.address,
      required this.gender,
      required this.username,
      required this.password}) : super(firstname:firstname, lastname:lastname, country:country, phonenumber:phonenumber, address:address, gender:gender );
}
