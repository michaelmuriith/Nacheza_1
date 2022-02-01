import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:player/constants.dart';
import 'package:player/widgets/bottom_nav.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          '@dennisoliechke',
          style: kSubtitleStyle,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      bottomNavigationBar: bottomNav(context),
      body: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset('assets/images/profile.jpg'),
          ),
          Text(
            'Dennis Oliech',
            style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [Container()],
          )
        ],
      ),
    );
  }
}
