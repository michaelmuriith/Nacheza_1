import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AccountSetup extends StatefulWidget {
  const AccountSetup({Key? key}) : super(key: key);

  @override
  _AccountSetupState createState() => _AccountSetupState();
}

class _AccountSetupState extends State<AccountSetup> {
  final items = ['What is your gender', 'male', 'female', 'other'];
  File? image;

  String? value;

  Future pickImage(source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      this.image = imageTemporary;
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
    }
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                children: [
                  Text(
                    'Welcome to gamegig!',
                    style: GoogleFonts.inter(
                      color: Color(0xFF363B64),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Lets set you up quickly.',
                    style: GoogleFonts.inter(
                      color: Color(0xFFd1d1d1),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 2.5,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Column(children: [
                  ImageProfile(),
                  textField(hint: "What’s your Firstname?", label: "Firstname"),
                  textField(hint: "What’s your Surname?", label: "Lastname"),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        child: CountryCodePicker(
                          initialSelection: 'KE',
                          showCountryOnly: true,
                          showFlagMain: true,
                          alignLeft: false,
                          flagWidth: 18,
                          showDropDownButton: true,
                          textStyle: const TextStyle(
                            fontSize: 0,
                            color: Colors.white,
                          ),
                          dialogBackgroundColor: Colors.white,
                          dialogTextStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          dialogSize: const Size(300, 500),
                          padding:
                              const EdgeInsets.only(top: 0, bottom: 0, left: 1),
                        ),
                      ),
                      Expanded(
                          child: textField(hint: "Enter phone?", label: "7..")),
                    ],
                  ),
                  DropdownButton<String>(
                      value: value,
                      hint: Text('What is your Gender'),
                      isExpanded: true,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(
                            () => this.value = value,
                          )),
                  Column(children: [
                    Align(
                        alignment: Alignment(-1, 0),
                        child: Text("Date of birth")),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(30),
                          primary: Colors.white, // background
                          onPrimary: Colors.black, // foreground
                        ),
                        onPressed: () => _selectDate(context),
                        label: Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: Color(0xff0601B4),
                        ),
                        icon: SizedBox(
                            width: 200,
                            child: Text(DateTime.now() == selectedDate
                                ? "Date of birth"
                                : "${selectedDate.toLocal()}".split(' ')[0]))),
                  ]),
                ]),
              ),
            ),
          ],
        ),
      )),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style:
              GoogleFonts.dmSans(fontWeight: FontWeight.normal, fontSize: 12),
        ),
      );

  Widget ImageProfile() {
    return Stack(
      children: [
        CircleAvatar(
            radius: 50.0,
            backgroundImage: image == null
                ? AssetImage('assets/images/Profile.png')
                : Image.file(image!) as ImageProvider),
        Positioned(
            bottom: 10,
            right: 10,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet(context)),
                );
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: 20,
              ),
            ))
      ],
    );
  }
}

Widget textField({required String hint, required String label}) {
  return Container(
    child: TextField(
      autofocus: false,
      decoration: InputDecoration(
          hintText: label,
          labelText: hint,
          labelStyle:
              GoogleFonts.dmSans(color: Color(0xFF424242), fontSize: 14)),
    ),
  );
}

Widget bottomSheet(context) {
  return Container(
    height: 100,
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Column(
      children: [
        Text("Choose profile photo",
            style: TextStyle(
              fontSize: 20.0,
            )),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pop(ImageSource.camera);
                },
                label: Text(
                  'Camera',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                icon: Icon(
                  Icons.camera,
                  color: Colors.black,
                )),
            TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pop(ImageSource.gallery);
                },
                label: Text(
                  'Gallery',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                icon: Icon(
                  Icons.image,
                  color: Colors.black,
                ))
          ],
        )
      ],
    ),
  );
}
