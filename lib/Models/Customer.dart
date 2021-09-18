import 'package:senior_project/Models/Person.dart';

class Customer extends Person {
  final String firstname, lastname, country, phonenumber, address, gender;

  Customer(
      {required this.firstname,
      required this.lastname,
      required this.country,
      required this.phonenumber,
      required this.address,
      required this.gender}): super(firstname:firstname, lastname:lastname, country:country, phonenumber:phonenumber, address:address, gender:gender );
}
