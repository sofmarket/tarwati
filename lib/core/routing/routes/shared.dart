import 'package:go_router/go_router.dart';
import 'package:tarwati/core/routing/custom_go_route.dart';
import 'package:tarwati/core/routing/routes.dart';
import 'package:tarwati/features/shared/presentation/pages/splash/screens/splash_screen.dart';
import 'package:tarwati/features/shared/presentation/pages/welcome/screens/welcome_screen.dart';

List<RouteBase> sharedRoutesList = [
  // splash
  CustomGoRoute(
    path: '/splash',
    name: Routes.splash.name,
    page: const SplashScreen(),
  ),
  // welcome
  CustomGoRoute(
    path: '/welcome',
    name: Routes.welcome.name,
    page: const WelcomeScreen(),
  ),
];
