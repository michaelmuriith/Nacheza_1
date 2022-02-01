import 'package:flutter/material.dart';
import 'package:player/constants.dart';
import 'package:player/models/company.dart';

class RecentJobCard extends StatelessWidget {
  final Company? company;
  const RecentJobCard({Key? key, this.company}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: const EdgeInsets.only(right: 18.0, top: 15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
          leading: Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: AssetImage(company!.image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(company!.job!, style: kTitleStyle),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),

              Text('Budget : "${company!.sallary}'),
              const SizedBox(
                height: 5,
              ),

              Text(
                "${company!.aboutCompany}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              // Text(
              //   "${company!.companyName} • ${company!.mainCriteria}",
              // ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: company!.tag!
                    .map(
                      (e) => Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 10.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                          border: Border.all(
                            color: kBlack,
                            width: 0.5,
                          ),
                        ),
                        child: Text(
                          e,
                          style: kSubtitleStyle.copyWith(
                            fontSize: 6.0,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          )),
    );
  }
}
