import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.hasSafeArea = false,
    this.statusBarColor,
    this.showBottomNavigationBarOnKeyboard = false,
    this.backgroundColor,
    this.extendBody = false,
    this.floatingActionButton,
    this.floatingActionButtonLocation =
        FloatingActionButtonLocation.endContained,
  });

  final bool hasSafeArea;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Color? statusBarColor;
  final bool showBottomNavigationBarOnKeyboard;
  final Color? backgroundColor;
  final bool extendBody;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    final effectiveStatusBarColor = statusBarColor ?? context.colors.bg;
    final isLight = effectiveStatusBarColor.computeLuminance() > 0.5;

    final overlayStyle = SystemUiOverlayStyle(
      statusBarColor: effectiveStatusBarColor,
      statusBarIconBrightness: isLight ? Brightness.dark : Brightness.light,
      statusBarBrightness: isLight ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: backgroundColor ?? context.colors.bg,
      systemNavigationBarIconBrightness: context.isDark
          ? Brightness.light
          : Brightness.dark,
    );

    final appBar = this.appBar != null
        ? this.appBar!
        : PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(
              elevation: 0,
              shadowColor: Colors.transparent,
              scrolledUnderElevation: 0,
              backgroundColor: effectiveStatusBarColor,
              systemOverlayStyle: overlayStyle,
            ),
          );

    final effectiveBody = hasSafeArea ? SafeArea(child: body) : body;

    if (!showBottomNavigationBarOnKeyboard || bottomNavigationBar == null) {
      final scaffold = Scaffold(
        appBar: appBar,
        body: effectiveBody,
        extendBody: extendBody,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        backgroundColor: backgroundColor ?? context.colors.bg,
      );

      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: scaffold,
      );
    } else {
      final scaffold = Scaffold(
        appBar: appBar,
        extendBody: extendBody,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        body: Column(
          children: [
            Expanded(child: effectiveBody),
            if (!extendBody) bottomNavigationBar!,
          ],
        ),
        bottomNavigationBar: extendBody ? bottomNavigationBar : null,
        backgroundColor: backgroundColor ?? context.colors.bg,
      );

      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: scaffold,
      );
    }
  }
}
