import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tarwati/core/routing/routes/auth.dart';
import 'package:tarwati/core/routing/routes/customer.dart';
import 'package:tarwati/core/routing/routes/shared.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(initialLocation: '/profile', routes: _routes);
});

List<RouteBase> get _routes {
  return [
    // auth
    ...authRoutesList,
    // customer
    ...customerRoutesList,
    // shared
    ...sharedRoutesList,
  ];
}
