import 'package:get/get.dart';
import 'package:grad_project/firebase/fb_auth_controller.dart';
import 'package:grad_project/routes/routes.dart';

class LunchController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        String route = FbAuthController().isLoggedIn
            ? Routes.homeScreen
            : Routes.outBoardingScreen;
        Get.offAllNamed(
          route,
        );
      },
    );
  }
}
