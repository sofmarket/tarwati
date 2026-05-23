import 'package:go_router/go_router.dart';
import 'package:tarwati/core/routing/custom_go_route.dart';
import 'package:tarwati/core/routing/routes.dart';
import 'package:tarwati/features/customer/presentation/pages/home/screens/home_screen.dart';
import 'package:tarwati/features/customer/presentation/pages/experts/screens/experts_screen.dart';
import 'package:tarwati/features/customer/presentation/pages/goals/screens/goals_screen.dart';
import 'package:tarwati/features/customer/presentation/pages/plan/screens/plan_screen.dart';
import 'package:tarwati/features/customer/presentation/pages/profile/screens/profile_screen.dart';

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
  // CustomGoRoute(
  //   path: '/expert-details',
  //   name: Routes.expertDetails.name,
  //   page: const ExpertDetailsScreen(),
  // ),
  CustomGoRoute(
    path: '/goals',
    name: Routes.goals.name,
    page: const GoalsScreen(),
  ),
  CustomGoRoute(
    path: '/plan',
    name: Routes.plan.name,
    page: const PlanScreen(),
  ),
  CustomGoRoute(
    path: '/profile',
    name: Routes.profile.name,
    page: const ProfileScreen(),
  ),
];
