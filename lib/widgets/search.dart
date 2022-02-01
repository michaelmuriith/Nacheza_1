import 'package:flutter/material.dart';

Widget searchBar(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.only(left: 8.0),
    margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: .0),
    decoration: BoxDecoration(
        color: const Color(0xffF77064),
        borderRadius: BorderRadius.circular(20)),
    child: TextFormField(
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.black,
      decoration: const InputDecoration(
        hintText: "Search for job title",
        icon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        suffixIcon: Icon(
          Icons.filter_list,
          color: Colors.white,
        ),
        border: InputBorder.none,
      ),
    ),
  );
}
