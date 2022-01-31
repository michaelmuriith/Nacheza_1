import 'package:flutter/material.dart';

class AuthTemplate extends StatelessWidget {
  final Widget child;
  const AuthTemplate({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/bg_2.png",
                ),
                fit: BoxFit.fitHeight,
                colorFilter:
                    ColorFilter.mode(Colors.black26, BlendMode.darken)),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.86,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
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
