import 'package:go_router/go_router.dart';
import 'package:tarwati/core/routing/custom_transition.dart';
import 'package:tarwati/core/routing/routes.dart';
import 'package:tarwati/features/customer/presentation/pages/home/screens/home_screen.dart';
import 'package:tarwati/features/customer/presentation/pages/experts/screens/experts_screen.dart';
import 'package:tarwati/features/customer/presentation/pages/goals/screens/goals_screen.dart';
import 'package:tarwati/features/customer/presentation/pages/plan/screens/plan_screen.dart';
import 'package:tarwati/features/customer/presentation/pages/profile/screens/profile_screen.dart';

List<RouteBase> customerRoutesList = [
  GoRoute(
    path: '/home',
    name: Routes.customer.name,
    pageBuilder: (context, state) => fadeTransitionPage<dynamic>(
      context: context,
      state: state,
      child: const HomeScreen(),
    ),
  ),
  GoRoute(
    path: '/experts',
    name: Routes.experts.name,
    pageBuilder: (context, state) => fadeTransitionPage<dynamic>(
      context: context,
      state: state,
      child: const ExpertsScreen(),
    ),
  ),
  // CustomGoRoute(
  //   path: '/expert-details',
  //   name: Routes.expertDetails.name,
  //   page: const ExpertDetailsScreen(),
  // ),
  GoRoute(
    path: '/goals',
    name: Routes.goals.name,
    pageBuilder: (context, state) => fadeTransitionPage<dynamic>(
      context: context,
      state: state,
      child: const GoalsScreen(),
    ),
  ),
  GoRoute(
    path: '/plan',
    name: Routes.plan.name,
    pageBuilder: (context, state) => fadeTransitionPage<dynamic>(
      context: context,
      state: state,
      child: const PlanScreen(),
    ),
  ),
  GoRoute(
    path: '/profile',
    name: Routes.profile.name,
    pageBuilder: (context, state) => fadeTransitionPage<dynamic>(
      context: context,
      state: state,
      child: const ProfileScreen(),
    ),
  ),
];
