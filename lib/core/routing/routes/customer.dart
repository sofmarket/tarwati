import 'package:go_router/go_router.dart';
import 'package:tarwati/core/routing/custom_go_route.dart';
import 'package:tarwati/core/routing/custom_transition.dart';
import 'package:tarwati/core/routing/routes.dart';
import 'package:tarwati/features/customer/presentation/pages/home/screens/home_screen.dart';
import 'package:tarwati/features/customer/presentation/pages/experts/models/expert_model.dart';
import 'package:tarwati/features/customer/presentation/pages/experts/screens/expert_appointment_screen.dart';
import 'package:tarwati/features/customer/presentation/pages/experts/screens/expert_details_screen.dart';
import 'package:tarwati/features/customer/presentation/pages/experts/screens/experts_screen.dart';
import 'package:tarwati/features/customer/presentation/pages/goals/screens/goals_screen.dart';
import 'package:tarwati/features/customer/presentation/pages/plan/screens/plan_screen.dart';
import 'package:tarwati/features/customer/presentation/pages/profile/screens/edit_profile_screen.dart';
import 'package:tarwati/features/customer/presentation/pages/profile/screens/preferences_screen.dart';
import 'package:tarwati/features/customer/presentation/pages/profile/screens/profile_screen.dart';

List<RouteBase> customerRoutesList = [
  // home
  GoRoute(
    path: '/home',
    name: Routes.customer.name,
    pageBuilder: (context, state) => fadeTransitionPage<dynamic>(
      context: context,
      state: state,
      child: const HomeScreen(),
    ),
  ),
  // goals
  GoRoute(
    path: '/goals',
    name: Routes.goals.name,
    pageBuilder: (context, state) => fadeTransitionPage<dynamic>(
      context: context,
      state: state,
      child: const GoalsScreen(),
    ),
  ),
  // plan
  GoRoute(
    path: '/plan',
    name: Routes.plan.name,
    pageBuilder: (context, state) => fadeTransitionPage<dynamic>(
      context: context,
      state: state,
      child: const PlanScreen(),
    ),
  ),
  // experts
  GoRoute(
    path: '/experts',
    name: Routes.experts.name,
    pageBuilder: (context, state) => fadeTransitionPage<dynamic>(
      context: context,
      state: state,
      child: const ExpertsScreen(),
    ),
    routes: [
      GoRoute(
        path: '/details',
        name: Routes.expertDetails.name,
        pageBuilder: (context, state) => fadeTransitionPage<dynamic>(
          context: context,
          state: state,
          child: ExpertDetailsScreen(expert: state.extra as ExpertModel?),
        ),
      ),
      GoRoute(
        path: '/appointment',
        name: Routes.expertAppointment.name,
        pageBuilder: (context, state) => fadeTransitionPage<dynamic>(
          context: context,
          state: state,
          child: ExpertAppointmentScreen(expert: state.extra as ExpertModel?),
        ),
      ),
    ],
  ),
  // profile
  GoRoute(
    path: '/profile',
    name: Routes.profile.name,
    pageBuilder: (context, state) => fadeTransitionPage<dynamic>(
      context: context,
      state: state,
      child: const ProfileScreen(),
    ),
    routes: [
      CustomGoRoute(
        path: '/edit-profile',
        name: Routes.editProfile.name,
        page: const EditProfileScreen(),
      ),
      CustomGoRoute(
        path: '/preferences',
        name: Routes.preferences.name,
        page: const PreferencesScreen(),
      ),
    ],
  ),
];
