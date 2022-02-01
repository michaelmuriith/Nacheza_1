import 'package:flutter/material.dart';
import 'package:Gamegig/constants.dart';
import 'package:Gamegig/models/company.dart';

class CompanyTab extends StatelessWidget {
  final Company? company;
  const CompanyTab({Key? key, this.company}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const SizedBox(height: 25.0),
        Text(
          "About the Brand",
          style: kTitleStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15.0),
        Text(
          company!.aboutCompany!,
          style: kSubtitleStyle.copyWith(
            fontWeight: FontWeight.w300,
            height: 1.5,
            color: const Color(0xFF5B5B5B),
          ),
        ),
      ],
    );
  }
}
