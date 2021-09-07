import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:senior_project/StyleTXT.dart';

Widget getDefaultTextFormField(
        {required bool obscure,
        IconData? iconData,
        required String lblText,
        required TextInputAction txtInputAction,
        IconButton? iconData2,
        required TextEditingController textEditingController,
        TextInputType? type,
        void Function()? submitted}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: Colors.grey[300]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextFormField(
          controller: textEditingController,
          obscureText: obscure,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                iconData,
                size: 30,
                color: Colors.white,
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: iconData2,
            ),
            labelText: lblText,
            hintStyle: whiteStyleTXT,
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          style: whiteStyleTXT,
          onTap: submitted,
          textInputAction: txtInputAction,
          keyboardType: type,
        ),
      ),
    );
