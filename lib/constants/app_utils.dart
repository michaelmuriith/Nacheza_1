import 'package:flutter/cupertino.dart';

class AppUtils {
  // Screen Size helpers

  double screenWidthF(BuildContext context, double ratio) {
    var screenWidth = MediaQuery.of(context).size.width * ratio;
    return screenWidth;
  }

  double screenHeightF(BuildContext context, double ratio) {
    var screenWidth = MediaQuery.of(context).size.height * ratio;
    return screenWidth;
  }
}
