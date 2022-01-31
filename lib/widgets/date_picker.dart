import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? date;

  String getText() {
    if (date == null) {
      return 'Select Date of birth';
    } else {
      return DateFormat('MM/dd/yyyy').format(date!);
    }
  }

  @override

  Widget build(BuildContext context) =>   TextButton.icon(
    style: TextButton.styleFrom(
      primary: Colors.black, // background
    ),
    onPressed:() => pickDate(context),
    icon: SizedBox(
      width: MediaQuery.of(context).size.width*0.8, 
      child: Text(
        getText(),
        style: GoogleFonts.dmSans(
          color: Color(0xff424242),
          fontSize: 14
        ),
      )
    ),
    label: Icon(Icons.calendar_today, size: 14, color: Color(0xff0601B4),),
  );

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 40),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (newDate == null) return;

    setState(() => date = newDate);
  }
}