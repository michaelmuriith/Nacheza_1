import 'package:flutter/material.dart';
import 'package:Gamegig/constants.dart';
import 'package:Gamegig/models/company.dart';
import 'package:Gamegig/views/job_detail/job_detail_view.dart';
import 'package:Gamegig/widgets/bottom_nav.dart';
import 'package:Gamegig/widgets/recent_job_card.dart';
import 'package:Gamegig/widgets/search.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: kSilver,
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          backgroundColor: kSilver,
          title: searchBar(context),
          bottom: TabBar(
            unselectedLabelColor: kBlack,
            labelPadding: const EdgeInsets.symmetric(horizontal: 5),
            indicator: BoxDecoration(
              color: kOrange,
              borderRadius: BorderRadius.circular(50),
            ),
            tabs: [
              Tab(
                child: Text(
                  'AVAILABLE',
                  style: kTabsStyle,
                ),
              ),
              Tab(
                child: Text(
                  'AVAILABLE',
                  style: kTabsStyle,
                ),
              ),
              Tab(
                child: Text(
                  'AVAILABLE',
                  style: kTabsStyle,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: bottomNav(context),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 15.0),
                Text(
                  "Recent Jobs",
                  style: kTitleStyle,
                ),
                ListView.builder(
                  itemCount: recentList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    var recent = recentList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JobDetail(
                              company: recent,
                            ),
                          ),
                        );
                      },
                      child: RecentJobCard(company: recent),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
