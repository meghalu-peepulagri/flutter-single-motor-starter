import 'package:get/get.dart';
import 'package:starter/app/presentation/modules/auth/login/login_page.dart';
import 'package:starter/app/presentation/modules/dashboard/dashboard_page.dart';
import 'package:starter/app/presentation/modules/splash/splash_page.dart';
import 'package:starter/app/presentation/routes/app_routes.dart';

class AppPages {
  static final getPages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashCopyWidget(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.loginwithmobile,
      page: () => const LoginwithmobileWidget(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
      GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}