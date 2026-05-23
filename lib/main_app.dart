import 'package:tarwati/core/di/dependency_injection.dart';
import 'package:tarwati/core/routing/app_router.dart';
import 'package:tarwati/core/theming/theme.dart';
import 'package:tarwati/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Autokayn',
      theme: getIt<AppTheme>().lightTheme,
      routerConfig: router,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      debugShowCheckedModeBanner: false,
    );
  }
}
