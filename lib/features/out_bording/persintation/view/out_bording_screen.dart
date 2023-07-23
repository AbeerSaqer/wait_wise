import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/core/resoursess/manager_strings.dart';
import 'package:grad_project/core/widgets/buttons.dart';
import 'package:grad_project/features/out_bording/persintation/controller/out_boarding_controller.dart';
import 'wigdet/outboardingpage.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OutBoardingScreen> createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<OutBoardingController>(
          init: OutBoardingController(),
          builder: (controller) => Column(
            children: [
              Visibility(
                visible: controller.pageIndex != 2,
                replacement: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: TextButton(
                    onPressed: () => Get.offAllNamed('/login_screen'),
                    style: TextButton.styleFrom(
                        primary: const Color(0xFF6C8EF2),
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          ManagerStrings.start,
                          style: GoogleFonts.quicksand(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: TextButton(
                    onPressed: () => controller.pageController.animateToPage(
                      2,
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      curve: Curves.easeIn,
                    ),
                    style: TextButton.styleFrom(
                        primary: const Color(0xFF6C8EF2),
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          ManagerStrings.skip,
                          style: GoogleFonts.quicksand(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: controller.pageController,
                  onPageChanged: (int pageIndex) {
                    setState(() {
                      controller.pageIndex = pageIndex;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  children: const [
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 34,
                        end: 33,
                      ),
                      child: OutBoardingPage(
                        image: "out1",
                        title: ManagerStrings.outBoardingTitle1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 34,
                        end: 33,
                      ),
                      child: OutBoardingPage(
                          image: "out2",
                          title: ManagerStrings.outBoardingTitle2),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 34,
                        end: 33,
                      ),
                      child: OutBoardingPage(
                        image: "out3",
                        title: ManagerStrings.outBoardingTitle3,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      if (controller.pageIndex != 0)
                        controller.pageController.previousPage(
                            duration: Duration(
                              seconds: 1,
                            ),
                            curve: Curves.easeInBack);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (controller.pageIndex != 2)
                        controller.pageController.nextPage(
                          duration: Duration(
                            seconds: 1,
                          ),
                          curve: Curves.easeInBack,
                        );
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                child: Visibility(
                  visible: controller.pageIndex == 2,
                  maintainState: true,
                  maintainSize: true,
                  maintainAnimation: true,
                  child: ButtonWidget(
                    title: ManagerStrings.getStartButton,
                    color: Colors.deepOrange,
                    onPressed: () => Get.offAllNamed('/login_screen'),
                    width: 193,
                    height: 55,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabPageSelectorIndicator(
                    backgroundColor:
                        controller.pageIndex == 0 ? Colors.blue : Colors.white,
                    borderColor: controller.pageIndex == 0
                        ? Colors.orange
                        : Color(0xFFEA5C5C),
                    size: 20,
                  ),
                  TabPageSelectorIndicator(
                    backgroundColor:
                        controller.pageIndex == 1 ? Colors.blue : Colors.white,
                    borderColor: controller.pageIndex == 1
                        ? Colors.orange
                        : Color(0xFFEA5C5C),
                    size: 20,
                  ),
                  TabPageSelectorIndicator(
                    backgroundColor:
                        controller.pageIndex == 2 ? Colors.blue : Colors.white,
                    borderColor: controller.pageIndex == 2
                        ? Colors.orange
                        : Color(0xFFEA5C5C),
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
