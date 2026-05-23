import 'package:go_router/go_router.dart';
import 'package:tarwati/core/routing/custom_go_route.dart';
import 'package:tarwati/core/routing/routes.dart';
import 'package:tarwati/features/customer/presentation/pages/home/screens/home_screen.dart';
import 'package:tarwati/features/customer/presentation/pages/experts/screens/experts_screen.dart';

List<RouteBase> customerRoutesList = [
  CustomGoRoute(
    path: '/home',
    name: Routes.customer.name,
    page: const HomeScreen(),
  ),
  CustomGoRoute(
    path: '/experts',
    name: Routes.experts.name,
    page: const ExpertsScreen(),
  ),
];
