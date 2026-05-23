import 'package:go_router/go_router.dart';
import 'package:tarwati/core/routing/custom_go_route.dart';
import 'package:tarwati/core/routing/routes.dart';
import 'package:tarwati/features/auth/presentation/screens/login_screen.dart';

List<RouteBase> authRoutesList = [
  // login
  CustomGoRoute(
    path: '/login',
    name: Routes.login.name,
    page: const LoginScreen(),
  ),
];