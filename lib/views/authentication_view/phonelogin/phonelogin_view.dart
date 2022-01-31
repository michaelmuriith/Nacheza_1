import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:player/views/authentication_view/otpverification/otpverification.dart';
import 'package:player/views/authentication_view/phonelogin/phonelogin_viewmodel.dart';
import 'package:player/widgets/auth_temp/auth_template.dart';
import 'package:player/widgets/number_pad.dart';
import 'package:stacked/stacked.dart';

class PhoneLoginView extends StatefulWidget {
  const PhoneLoginView({Key? key}) : super(key: key);

  @override
  State<PhoneLoginView> createState() => _PhoneLoginViewState();
}

class _PhoneLoginViewState extends State<PhoneLoginView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhoneLoginModel>.reactive(
        viewModelBuilder: () => PhoneLoginModel(),
        builder: (context, model, child) => Scaffold(
              body: SafeArea(
                top: true,
                child: AuthTemplate(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter your\nmobile number',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        Text('We will send your confirmation code',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: const Color(0xff989898))),
                        Expanded(
                          child: Container(
                            height: 40,
                            margin: const EdgeInsets.symmetric(vertical: 14.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    '+254',
                                    style: GoogleFonts.poppins(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff989898)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(model.mobileNo,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(model.error,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Colors.red)),
                        ),
                        NumericPad(
                          onNumberSelected: (value) {
                            model.updateNumber(value);
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(30),
                            primary: const Color(0xff98DFD5), // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            model.signUp(context, model.mobileNo);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EnterOtpView(mobileNo: model.mobileNo)),
                            );
                          },
                          child: const Text('Send'),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'By Creating passcode you agree with our \nTerms & Conditions and Privacy Policy',
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
