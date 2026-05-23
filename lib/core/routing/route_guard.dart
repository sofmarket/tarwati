/// Route guard utility to determine which routes require authentication
class RouteGuard {
  /// Public routes that guests can access without authentication
  static const Set<String> publicRoutes = {
    '/customer', // Home screen
    '/customer/services', // Services screen
    '/login',
    '/phone',
    '/otp',
    '/phone/otp',
    '/splash',
    '/loading',
    '/scanner',
    '/privacy-policy',
    '/terms-and-conditions',
    '/about',
    '/safety',
    '/support',
    '/fees-and-taxs',
    '/customer/accident-assistance',
    '/customer/wheels',
    '/customer/change-city',
    '/customer/products',
    '/customer/products/details',
    '/customer/brands',
    '/customer/brands/models',
    '/customer/brands/generations',
    '/customer/brands/parts-categories',
    '/customer/brands/parts',
    '/customer/profile',
  };

  /// Check if a route requires authentication
  static bool requiresAuth(String location) {
    // Normalize the location (remove query parameters and fragments)
    final normalizedLocation = location.split('?').first.split('#').first;

    // Check if it's exactly a public route (exact match only)
    // This ensures only explicitly listed routes are public
    return !publicRoutes.contains(normalizedLocation);
  }

  /// Check if a route is public (guest accessible)
  static bool isPublicRoute(String location) {
    return !requiresAuth(location);
  }
}
