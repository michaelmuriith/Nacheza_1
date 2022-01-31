import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountSetupTemplate extends StatelessWidget {
  final Widget child;
  final double height;
  final String title;
  final String description;
  final String? imageUrl;
  final bool image;
  const AccountSetupTemplate({
    Key? key,
    required this.child,
    required this.height,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Color(0xffffffff)),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.15,
          child: Column(
            children: [
              image == true ? Image.asset(imageUrl!) : const SizedBox.shrink(),
              Text(
                title,
                style: GoogleFonts.inter(
                  color: const Color(0xFF363B64),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                description,
                style: GoogleFonts.inter(
                  color: Color(0xFFd1d1d1),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color(0xfffdfdfd),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 5,
                    blurRadius: 2.5,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
            child: child,
          ),
        )
      ],
    );
  }
}
