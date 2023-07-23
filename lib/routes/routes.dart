import 'package:flutter/material.dart';
import 'package:grad_project/features/app/about_page.dart';
import 'package:grad_project/features/app/appoitment_details.dart';
import 'package:grad_project/features/app/booking_service.dart';
import 'package:grad_project/features/app/editing_personal_page.dart';
import 'package:grad_project/features/app/home_page.dart';
import 'package:grad_project/features/app/location_map.dart';
import 'package:grad_project/features/app/profile_page.dart';
import 'package:grad_project/features/app/qr_code.dart';
import 'package:grad_project/features/app/service_desc.dart';
import 'package:grad_project/features/app/service_page.dart';
import 'package:grad_project/features/auth/persintation/view/forget_password.dart';
import 'package:grad_project/features/auth/persintation/view/login_screen.dart';
import 'package:grad_project/features/auth/persintation/view/resgister_screen.dart';
import 'package:grad_project/features/lunch/persintation/view/lunch_screen.dart';
import 'package:grad_project/features/out_bording/persintation/view/out_bording_screen.dart';
import 'package:grad_project/firebase/fetch_data.dart';

class Routes {
  static const String lunchScreen = '/launch_screen';
  static const String fetchData = '/fetch_data';
  static const String outBoardingScreen = '/out_boarding_screen';
  static const String homeScreen = '/home_screen';
  static const String profileScreen = '/profile_screen';
  static const String forgerPassword = '/forger_password';
  static const String serviceScreen = '/service_screen';
  static const String registerScreen = '/register_screen';
  static const String loginScreen = '/login_screen';
  static const String editingProfileScreen = '/editing_profile_screen';
  static const String serviceDesScreen = '/service_des_screen';
  static const String bookingServiceScreen = '/booking_service_screen';
  static const String aboutScreen = '/about_screen';
  static const String branchScreen = '/branch_screen';
  static const String changePasswordScreen = '/change_password_screen';
  static const String map = '/map';
  static const String appointmentScreen = '/appointment_screen';
  static const String qrCodeScreen = '/qr_code_screen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.lunchScreen:
        //      initSplash();
        return MaterialPageRoute(builder: (_) => const LunchScreen());
      case Routes.outBoardingScreen:
        //   initOutBoarding();
        return MaterialPageRoute(builder: (_) => const OutBoardingScreen());
      case Routes.loginScreen:
        //    initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerScreen:
        //    initRegisterModule();
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.forgerPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.serviceDesScreen:
        return MaterialPageRoute(builder: (_) => const ServiceDescription());
      case Routes.serviceScreen:
        return MaterialPageRoute(builder: (_) => const ServiceScreen());
      case Routes.fetchData:
        return MaterialPageRoute(builder: (_) => const FetchData());
      case Routes.aboutScreen:
        return MaterialPageRoute(builder: (_) => const AboutScreen());
      case Routes.appointmentScreen:
        return MaterialPageRoute(builder: (_) => const AppointmentDetails());
      case Routes.bookingServiceScreen:
        return MaterialPageRoute(builder: (_) => const BookingService());
      case Routes.serviceScreen:
        return MaterialPageRoute(builder: (_) => const ServiceScreen());
      case Routes.serviceDesScreen:
        return MaterialPageRoute(builder: (_) => const ServiceDescription());
      case Routes.editingProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditingProfile());
      case Routes.branchScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.map:
        return MaterialPageRoute(builder: (_) => MapView());
      case Routes.qrCodeScreen:
        return MaterialPageRoute(builder: (_) => const QrCodeScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text("noRoutFound"),
        ),
        body: Center(
          child: Text("noRoutFound"),
        ),
      ),
    );
  }
}
