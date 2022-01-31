import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumericPad extends StatelessWidget {
  const NumericPad({ 
    Key? key, required this.onNumberSelected }) : super(key: key);

  final Function(int) onNumberSelected;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffffffff),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildNumber(1),
              buildNumber(2),
              buildNumber(3),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildNumber(4),
              buildNumber(5),
              buildNumber(6),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildNumber(7),
              buildNumber(8),
              buildNumber(9),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildEmptySpace(),
              buildNumber(0),
              buildBackspace(),
            ],
          ),

        ],
      ),
    );
  }

  Widget buildNumber(int number) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onNumberSelected(number);
        },
        child: SizedBox(
          height: 50,
          child: Text(number.toString(), textAlign: TextAlign.center, style: GoogleFonts.poppins(
            fontSize: 23,
            fontWeight: FontWeight.w500,
            color: const Color(0xff333333)
          ))
        ),
      ),
    );
  }

  Widget buildBackspace() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onNumberSelected(-1);
        },
        child: const SizedBox(
            height: 40,
            child: Icon(Icons.backspace_outlined),
          ),
      ),
    );
  }

  Widget buildEmptySpace() {
    return Expanded(
      child: Container(),
    );
  }

}