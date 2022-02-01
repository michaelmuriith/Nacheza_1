import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Gamegig/constants.dart';
import 'package:Gamegig/widgets/bottom_nav.dart';
import 'package:Gamegig/widgets/search.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSilver,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: kSilver,
        title: SizedBox(
          child: searchBar(context),
          width: MediaQuery.of(context).size.width,
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
              //   ListView.builder(
              //     itemCount: recentList.length,
              //     scrollDirection: Axis.vertical,
              //     shrinkWrap: true,
              //     physics: const ScrollPhysics(),
              //     itemBuilder: (context, index) {
              //       var recent = recentList[index];
              //       return InkWell(
              //         onTap: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => JobDetail(
              //                 company: recent,
              //               ),
              //             ),
              //           );
              //         },
              //         child: RecentJobCard(company: recent),
              //       );
              //     },
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
