import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Gamegig/views/home/home_view.dart';
import 'package:Gamegig/views/search/search_view.dart';

import '../constants.dart';

Widget bottomNav(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      IconButton(
          icon: SvgPicture.asset(
            'assets/svg/Home.svg',
            color: kRed,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Home()));
          }),
      IconButton(
          icon: SvgPicture.asset('assets/svg/Heart.svg'),
          onPressed: () {
            //             Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ),
            //   ),
            // );
          }),
      IconButton(
          icon: SvgPicture.asset('assets/svg/ADD.svg'), onPressed: () {}),
      IconButton(
          icon: SvgPicture.asset('assets/svg/Search.svg'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SearchView()));
          }),
      IconButton(icon: const Icon(Icons.person), onPressed: () {}),
    ],
  );
}
