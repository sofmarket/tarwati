import 'package:tarwati/core/network/dio_client.dart';
import 'package:tarwati/core/routing/initial_route.dart';
import 'package:tarwati/core/services/secure_storage_service.dart';
import 'package:tarwati/core/theming/theme.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Router - Now handled by Riverpod provider
  getIt.registerLazySingleton(() => const InitialRoute());

  // secure storage
  getIt.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(),
  );

  // Dio & ApiService (depends on SecureStorageService for token interceptor)
  getIt.registerLazySingleton<DioClient>(
    () => DioClient(getIt<SecureStorageService>()),
  );

  // Theme
  getIt.registerLazySingleton<AppTheme>(() => AppTheme());
}
