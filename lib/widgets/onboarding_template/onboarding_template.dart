import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Gamegig/constants/app_utils.dart';

class OnboardingTemplate extends StatelessWidget {
  final String imageurl;
  final String title;
  final String desc;
  final Color color;

  const OnboardingTemplate({
    Key? key,
    required this.imageurl,
    required this.title,
    required this.desc,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Flexible(
            child: SizedBox.shrink(),
            flex: 2,
          ),
          Flexible(
            child: Image.asset(
              imageurl,
              height: AppUtils().screenHeightF(context, 0.8),
              width: AppUtils().screenWidthF(context, 0.6),
            ),
            flex: 6,
          ),
          Flexible(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 40, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.playfairDisplay(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25.67,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    desc,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff333333),
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
