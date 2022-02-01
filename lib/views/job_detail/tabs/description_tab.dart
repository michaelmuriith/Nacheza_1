import 'package:flutter/material.dart';
import 'package:Gamegig/constants.dart';
import 'package:Gamegig/models/company.dart';

class DescriptionTab extends StatelessWidget {
  final Company? company;
  const DescriptionTab({Key? key, this.company}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const SizedBox(height: 25.0),
        Text(
          "About the Opportunity",
          style: kTitleStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15.0),
        Text(
          company!.jobOpportunity!,
          style: kSubtitleStyle.copyWith(
            fontWeight: FontWeight.w300,
            height: 1.5,
            color: const Color(0xFF5B5B5B),
          ),
        ),
        const SizedBox(height: 25.0),
        Text(
          "Job Responsbilities",
          style: kTitleStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15.0),
        Column(
          children: company!.jobResponsbilities!
              .map(
                (e) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "•  ",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 35.0),
                    ),
                    Expanded(
                      child: Text(
                        "$e\n",
                        style: kSubtitleStyle.copyWith(
                          fontWeight: FontWeight.w300,
                          height: 1.5,
                          color: const Color(0xFF5B5B5B),
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
