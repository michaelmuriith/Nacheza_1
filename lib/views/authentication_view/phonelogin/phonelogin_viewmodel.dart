import 'package:flutter/material.dart';
import 'package:Gamegig/view_models/template_model.dart';
import 'package:Gamegig/router/routers.dart' as routes;

class PhoneLoginModel extends TemplateModel {
  String _mobileNo = '';
  String mobileNo = "";

  String error = "";
  bool isLoading = false;
  String otpCode = "";
  final int otpCodeLength = 6;
  bool isAPICallProcess = false;
  String msg = "";

  signUp(BuildContext context, mobileNo) {
    if (mobileNo.length < 9) {
      error = "Invalid phone";
    } else {
      isLoading = true;
      _mobileNo = mobileNo;
    }
    notifyListeners();
  }

  verifyPhone(BuildContext context, mobile) {
    Navigator.pushNamed(context, routes.accountSetupPage);
    notifyListeners();
  }

  updateNumber(value) {
    error = '';
    if (value != -1) {
      if (mobileNo.length < 10) {
        mobileNo = mobileNo + value.toString();
        notifyListeners();
      }
    } else {
      if (mobileNo.isEmpty) {
        mobileNo = '';
      } else {
        mobileNo = mobileNo.substring(0, mobileNo.length - 1);
        notifyListeners();
      }
    }
    notifyListeners();
  }
}
