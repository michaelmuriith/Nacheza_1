// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:player/models/company.dart';
import 'package:player/constants.dart';
import 'package:player/views/job_detail/tabs/tabs.dart';

class JobDetail extends StatelessWidget {
  final Company? company;
  const JobDetail({this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSilver,
      body: SafeArea(
        top: true,
        child: DefaultTabController(
          length: 2,
          child: Container(
            width: double.infinity,
            // margin: EdgeInsets.only(top: 50.0),
            color: Colors.white,
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
            child: Stack(
              children: [
                Column(
                  children: <Widget>[
                    Container(
                      constraints: const BoxConstraints(maxHeight: 250.0),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                  image: AssetImage(company!.image!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            company!.job!,
                            style: kTitleStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            company!.sallary!,
                            style: kSubtitleStyle,
                          ),
                          const SizedBox(height: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: company!.tag!
                                .map(
                                  (e) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 5.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                          color: kBlack.withOpacity(.5)),
                                    ),
                                    child: Text(
                                      e,
                                      style: kSubtitleStyle,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(height: 25.0),
                          Material(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide(
                                color: kBlack.withOpacity(.2),
                              ),
                            ),
                            // borderRadius: BorderRadius.circular(12.0),
                            child: const TabBar(
                              labelColor: kBlack,
                              unselectedLabelColor: kBlack,
                              indicator: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.blue,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              tabs: [
                                Tab(text: "Description"),
                                Tab(text: "Brand"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Expanded(
                      child: TabBarView(
                        children: [
                          DescriptionTab(company: company),
                          CompanyTab(company: company),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade50,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: kBlack,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          padding: const EdgeInsets.only(left: 18.0, bottom: 5.0, right: 18.0),
          // margin: EdgeInsets.only(bottom: 25.0),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: kBlack,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      "Apply for Job",
                      style: kTitleStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
