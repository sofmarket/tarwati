import 'package:tarwati/core/di/dependency_injection.dart';
import 'package:tarwati/core/utils/preferences.dart';
import 'package:tarwati/gen/strings.g.dart';
import 'package:tarwati/main_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // * Initialize the Firebase app
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // * Allow only portrait orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // * Initialize the Firebase Messaging
  // await FirebaseMsg().initialize();

  // * Make GoRouter's push and pop methods work on web urls
  // Note: This needs to be set before creating the router
  GoRouter.optionURLReflectsImperativeAPIs = true;

  // * Initialize the dependency injection (SecureStorageService is created here as singleton)
  await setupGetIt();

  // * Initialize the shared preferences
  await Preferences.init();

  runApp(
    TranslationProvider(
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        child: const ProviderScope(child: MainApp()),
      ),
    ),
  );
}
