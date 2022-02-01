import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:Gamegig/views/onboarding_view/onboarding_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:Gamegig/router/routers.dart' as routes;

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int page = 0;
  late LiquidController liquidController;
  late UpdateType updateType;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  Widget _buildDot(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: 7.62,
        width: 7.62,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              index == page ? const Color(0xffffffff) : const Color(0xff4f4f4f),
          border: Border.all(
            color: const Color(0xff4f4f4f),
            width: 1,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingModel>.reactive(
        viewModelBuilder: () => OnboardingModel(),
        builder: (context, model, child) => MaterialApp(
              home: Scaffold(
                body: Stack(
                  children: <Widget>[
                    LiquidSwipe(
                        pages: model.pages,
                        onPageChangeCallback: pageChangeCallback,
                        waveType: WaveType.liquidReveal,
                        liquidController: liquidController,
                        enableSideReveal: true,
                        ignoreUserGestureWhileAnimating: true,
                        positionSlideIcon: 0.65,
                        slideIconWidget: Padding(
                          padding: const EdgeInsets.only(
                              right: 15.0, top: 20, bottom: 10),
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xff989898)),
                                shape: BoxShape.circle),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 15,
                                color: Color(0xff989898),
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                      left: 20,
                      bottom: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List<Widget>.generate(
                            model.pages.length, _buildDot),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: page != 2
                              ? TextButton(
                                  onPressed: () {
                                    liquidController.animateToPage(
                                        page: model.pages.length - 1,
                                        duration: 700);
                                  },
                                  child: Text("Next",
                                      style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      )),
                                )
                              : TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, routes.authView);
                                  },
                                  child: Text("Continue",
                                      style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      )),
                                )),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextButton(
                          onPressed: () {
                            liquidController.jumpToPage(
                                page: liquidController.currentPage - 1 >
                                        model.pages.length + 1
                                    ? 0
                                    : liquidController.currentPage - 1);
                          },
                          child: Text("prev",
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
