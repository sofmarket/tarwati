import 'package:go_router/go_router.dart';
import 'package:tarwati/core/routing/custom_go_route.dart';
import 'package:tarwati/core/routing/custom_transition.dart';
import 'package:tarwati/core/routing/routes.dart';
import 'package:tarwati/features/shared/presentation/pages/about/screens/terms_screen.dart';
import 'package:tarwati/features/shared/presentation/pages/chat/models/call_session_model.dart';
import 'package:tarwati/features/shared/presentation/pages/about/screens/about_screen.dart';
import 'package:tarwati/features/shared/presentation/pages/notifications/screens/notifications_screen.dart';
import 'package:tarwati/features/shared/presentation/pages/splash/screens/splash_screen.dart';
import 'package:tarwati/features/shared/presentation/pages/welcome/screens/welcome_screen.dart';
import 'package:tarwati/features/shared/presentation/pages/chat/screens/chat_screen.dart';
import 'package:tarwati/features/shared/presentation/pages/chat/screens/conversations_screen.dart';
import 'package:tarwati/features/shared/presentation/pages/chat/screens/call_screen.dart';

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

  // chat
  GoRoute(
    path: '/chat',
    name: Routes.chat.name,
    pageBuilder: (context, state) {
      final extra = state.extra;

      if (extra is CallSessionModel) {
        return fadeTransitionPage<dynamic>(
          context: context,
          state: state,
          child: ChatScreen(
            expertName: extra.expertName,
            expertImagePath: extra.expertImagePath,
          ),
        );
      }

      return fadeTransitionPage<dynamic>(
        context: context,
        state: state,
        child: const ChatScreen(),
      );
    },
  ),
  CustomGoRoute(
    path: '/conversations',
    name: Routes.conversations.name,
    page: const ConversationsScreen(),
  ),
  GoRoute(
    path: '/call',
    name: Routes.call.name,
    pageBuilder: (context, state) => fadeTransitionPage<dynamic>(
      context: context,
      state: state,
      child: CallScreen(session: state.extra as CallSessionModel?),
    ),
  ),

  // notifications
  CustomGoRoute(
    path: '/notifications',
    name: Routes.notifications.name,
    page: const NotificationsScreen(),
  ),

  // about
  CustomGoRoute(
    path: '/about',
    name: Routes.about.name,
    page: const AboutScreen(),
  ),
  CustomGoRoute(
    path: '/terms-and-conditions',
    name: Routes.termsAndConditions.name,
    page: const TermsScreen(),
  ),
];
