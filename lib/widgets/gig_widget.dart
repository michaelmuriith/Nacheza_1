import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class GigInput extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Function() controller;
  final Function() onSaved;
 

  GigInput({
    required this.hintText,
    required this.labelText, 
    required this.controller, 
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        maxLines: 1,
        controller: controller(),
        onSaved: onSaved(),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          labelText:  labelText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          labelStyle: GoogleFonts.dmSans(
            color: Color(0xff424242),
            fontSize: 14
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }
}

class PhoneInput extends StatelessWidget {
  const PhoneInput({ Key? key, required TextEditingController myPhone }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: CountryCodePicker(
              hideMainText: true,
              showFlagMain: true,
              showFlag: false,
              initialSelection: 'KE',
              hideSearch: true,
              showCountryOnly: true,
              showOnlyCountryWhenClosed: true,
              alignLeft: true,
              flagWidth: 30,
              showDropDownButton: false,
              dialogBackgroundColor: Colors.white,
              dialogTextStyle: const TextStyle(
                 color: Colors.black,
              ),
              dialogSize: const Size(300, 500),
              padding: const EdgeInsets.only(top: 0, bottom: 0, left: 1),
            ),
          ),
          Expanded(child: TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              hintText: 'Enter Phone',
              border: InputBorder.none,
              labelStyle: GoogleFonts.dmSans(
                color: Color(0xff424242),
                fontSize: 14
              ),
              hintStyle: GoogleFonts.dmSans(
                color: Color(0xff424242),
                fontSize: 14
              ),
            ),
          )),
        ],
      ),
    );
  }
}