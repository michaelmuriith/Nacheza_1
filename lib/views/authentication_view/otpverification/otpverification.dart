import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Gamegig/views/authentication_view/phonelogin/phonelogin_viewmodel.dart';
import 'package:Gamegig/widgets/auth_temp/auth_template.dart';
import 'package:Gamegig/widgets/number_pad.dart';
import 'package:stacked/stacked.dart';

class EnterOtpView extends StatefulWidget {
  final String mobileNo;
  const EnterOtpView({Key? key, required this.mobileNo}) : super(key: key);

  @override
  State<EnterOtpView> createState() => _EnterOtpViewState();
}

class _EnterOtpViewState extends State<EnterOtpView> {
  late FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.requestFocus();
  }

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
                          'Enter code sent \nto your Phone',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                            'Check your phone code sent to +254 ' +
                                widget.mobileNo,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: const Color(0xff989898))),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              buildCodeNumberBox(model.otpCode.length > 0
                                  ? model.otpCode.substring(0, 1)
                                  : ""),
                              buildCodeNumberBox(model.otpCode.length > 1
                                  ? model.otpCode.substring(1, 2)
                                  : ""),
                              buildCodeNumberBox(model.otpCode.length > 2
                                  ? model.otpCode.substring(2, 3)
                                  : ""),
                              buildCodeNumberBox(model.otpCode.length > 3
                                  ? model.otpCode.substring(3, 4)
                                  : ""),
                              buildCodeNumberBox(model.otpCode.length > 4
                                  ? model.otpCode.substring(4, 5)
                                  : ""),
                              buildCodeNumberBox(model.otpCode.length > 5
                                  ? model.otpCode.substring(5, 6)
                                  : ""),
                            ],
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
                            setState(() {
                              if (value != -1) {
                                if (model.otpCode.length < 6) {
                                  model.otpCode =
                                      model.otpCode + value.toString();
                                }
                              } else {
                                if (model.otpCode.isEmpty) {
                                  model.otpCode = '';
                                } else {
                                  model.otpCode = model.otpCode
                                      .substring(0, model.otpCode.length - 1);
                                }
                              }
                            });
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(30),
                            primary: const Color(0xff98DFD5), // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            // model.verifyPhone(
                            //     context, '+254' + widget.mobileNo);
                            // print(widget.mobileNo);
                            SnackBar(content: Text('loading'));
                          },
                          child: const Text('verify'),
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

Widget buildCodeNumberBox(String codeNumber) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: SizedBox(
      width: 30,
      height: 30,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF6F5FA),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Center(
          child: Text(
            codeNumber,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F1F1F),
            ),
          ),
        ),
      ),
    ),
  );
}
