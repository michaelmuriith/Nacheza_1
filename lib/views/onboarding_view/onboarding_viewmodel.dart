import 'package:flutter/material.dart';
import 'package:Gamegig/view_models/template_model.dart';

import '../../widgets/widgets.dart';

class OnboardingModel extends TemplateModel {
  List<Widget> pages = [
    const OnboardingTemplate(
        imageurl: "assets/images/client1.png",
        title: "Activate your Game \ntoday",
        desc:
            'get started by setting your proffessional sports brand by setting your portfolio and experience and stand out in the market.',
        color: Color(0xffffffff)),
    const OnboardingTemplate(
        imageurl: "assets/images/client2.png",
        title: "Connect  with your \nlocal Brands",
        desc:
            "Connect with local and international brands looking for sports brand ambassadors.",
        color: Color(0xff98DFD5)),
    const OnboardingTemplate(
        imageurl: "assets/images/client3.png",
        title: "Unlock Your New \nValue",
        desc:
            "And Bam! You are on your way to getting a gig of a lifetime and earning big time! Its that simple",
        color: Color(0xffFFADC4)),
  ];
}
