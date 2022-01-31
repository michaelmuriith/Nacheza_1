import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:player/views/authentication_view/phonelogin/phonelogin_view.dart';
import 'package:player/widgets/auth_temp/auth_template.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            top: true,
            child: AuthTemplate(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(child: Container()),
                          Image.asset(
                            'assets/images/name_logo.png',
                            width: MediaQuery.of(context).size.width * 0.55,
                          ),
                          Expanded(child: Container()),
                          ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xffF76545), // background
                                onPrimary: Colors.white, // foreground
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PhoneLoginView()),
                                );
                              },
                              icon: const Icon(Icons.phone),
                              label: const Text('Sign up with phone number')),
                          Row(children: <Widget>[
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 20.0),
                                  child: const Divider(
                                    color: Color(0xff98DFD5),
                                    thickness: 2,
                                    height: 46,
                                  )),
                            ),
                            const Text("OR"),
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 20.0),
                                  child: const Divider(
                                    color: Color(0xff98DFD5),
                                    thickness: 2,
                                    height: 46,
                                  )),
                            ),
                          ]),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white70, // background
                              onPrimary: const Color(0xff050038), // foreground
                            ),
                            onPressed: () {},
                            icon: Image.asset('assets/icons/google.png'),
                            label: const Text('Sign up with google'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Image.asset(
                                    'assets/icons/fb_messenger.png'),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Image.asset('assets/icons/twitter.png'),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          RichText(
                              text: TextSpan(
                                  style: GoogleFonts.robotoSlab(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                  children: const [
                                TextSpan(
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                  ),
                                  text: "Already have an account ?",
                                ),
                                TextSpan(
                                  style: TextStyle(
                                    color: Color(0xffF76545),
                                  ),
                                  text: " Sign In",
                                ),
                              ])),
                          Text(
                            'By Creating passcode you agree with our \nTerms & Conditions and Privacy Policy',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                            ),
                          ),
                          Expanded(child: Container()),
                        ])))));
  }
}
