class ApiConstants {
  static const String baseUrl = 'autokayn.ma'; // prod

  static const String apiBaseUrl = 'https://$baseUrl/api/v1/';

  static const String checkAppData = '/shared/check-app-data';

  // Auth routes
  static const String login = '/auth/login';

  static const String logout = '/auth/logout';
  static const String deleteAccount = '/auth/delete-account';

  static const String sendOtp = '/auth/send-otp';
  static const String verifyOtp = '/auth/verify-otp';
  static const String googleSignIn = '/auth/google';

  // Vehicles routes
  static const String getBrands = '/shared/brands';
  static const String getModels = '/shared/vehicle-models';
  static const String getGenerations = '/shared/vehicle-generations';

  // Shared routes
  static const String getProfile = '/shared/profile';
  static const String sharedOrderData = '/shared/order-data/{uuid}';
  static const String updateProfile = '/shared/profile';
  static const String getCities = '/shared/cities';
  static const String getPaymentMethods = '/shared/payment-methods';
  static const String initiatePayment = '/shared/payments/initiate';
  static const String getShippingMethods = '/shared/shipping-methods';
  static const String getCountries = '/shared/countries';
  static const String changeCity = '/shared/change-city';
  static const String getNotifications = '/shared/notifications';
  static const String markAllNotificationsRead = '/shared/notifications/read';
  static const String getProducts = '/shared/products';
  static const String getProductCategories = '/shared/product-categories';
  static const String homeProducts = '/shared/home/products';
  static const String changeUserMode = '/shared/change-user-mode';
  static const String sharedWalletTransactions = '/shared/wallet/transactions';
  static const String orderReceiptPdf = 'shared/pdf/order-receipt';

  // Customer routes
  static const String createProductRequest = '/customer/product-requests';
  static const String accidentAssistance = '/customer/accident-assistance';
  static const String getCustomerOrders = '/customer/orders';
  static const String createCustomerOrder = '/customer/orders';
  static const String getCart = '/customer/cart';
  static const String addCartItem = '/customer/cart/items';
  static const String removeCartItem = '/customer/cart/items/{itemId}';
  static const String acceptCustomerOffer = '/customer/offers/accept';
  static const String negotiateCustomerOffer = '/customer/offers/negotiate';

  // Vendor routes
  static const String vendorProductRequests = '/vendor/product-requests';
  static const String vendorRegister = '/vendor/register';
  static const String vendorProducts = '/vendor/products';
  static const String vendorOffers = '/vendor/offers';
  static const String vendorOrders = '/vendor/orders';
  static const String vendorAcceptCustomerProposal = '/vendor/offers/accept';
  static const String vendorRejectCustomerProposal = '/vendor/offers/reject';
  static const String vendorAvailability = '/vendor/availability';

  // Shared lookups (used by vendor register)
  static const String getVehicleTypes = '/shared/vehicle-types';
  static const String getBanks = '/shared/banks';

  static const webSocketUrl = 'http://$baseUrl:3000';
  static const webSocketChannel = 'presence-chat-channel';

  // Laravel Reverb / broadcasting (private channel auth)
  static const String broadcastingAuth = 'https://$baseUrl/broadcasting/auth';
  // Reverb server — align with Laravel REVERB_HOST, REVERB_PORT, REVERB_APP_KEY
  static const String reverbHost = baseUrl;
  static const int reverbPort = 443;
  static const bool reverbUseTLS = true;
  static const String reverbAppKey = '7am5rjt3c9viqqjdh9as';
}

class ApiErrors {
  static const String badRequestError = 'badRequestError';
  static const String noContent = 'noContent';
  static const String forbiddenError = 'forbiddenError';
  static const String unauthorizedError = 'unauthorizedError';
  static const String notFoundError = 'notFoundError';
  static const String conflictError = 'conflictError';
  static const String internalServerError = 'internalServerError';
  static const String unknownError = 'unknownError';
  static const String timeoutError = 'timeoutError';
  static const String defaultError = 'defaultError';
  static const String cacheError = 'cacheError';
  static const String noInternetError = 'noInternetError';
  static const String loadingMessage = 'loading_message';
  static const String retryAgainMessage = 'retry_again_message';
  static const String ok = 'Ok';
}
