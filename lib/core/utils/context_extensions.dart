import 'package:animations/animations.dart';
import 'package:tarwati/core/di/dependency_injection.dart';
import 'package:tarwati/core/theming/colors.dart';
import 'package:tarwati/core/theming/theme.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
// import 'package:tarwati/core/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppTheme get appTheme => getIt<AppTheme>();
  AppColors get colors => appTheme.colors;
  AppColors get themeColors => isDark ? appTheme.darkColors : appTheme.colors;
  ColorScheme get colorScheme => theme.colorScheme;
  NavigatorState get navigator => Navigator.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  TextTheme get textTheme => theme.textTheme;
  Size get size => mediaQuery.size;
  double get height => size.height;
  double get width => size.width;

  bool get isDark => colorScheme.isDark;
  bool get isLight => colorScheme.isLight;

  TextDirection get direction => Directionality.of(this);
  bool get isRtl => direction == TextDirection.rtl;
  bool get isLtr => direction == TextDirection.ltr;

  FocusScopeNode get focusScope => FocusScope.of(this);
  EdgeInsets get padding => mediaQuery.padding;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;
  EdgeInsets get viewPadding => mediaQuery.viewPadding;
  EdgeInsets get viewPaddingWithoutInsets => viewPadding - viewInsets;
  EdgeInsets get paddingWithoutViewInsets => padding - viewPadding;
  double get topInset => viewInsets.top;
  Locale get flutterLocale => Localizations.localeOf(this);
  String get localeLanguageCode => flutterLocale.languageCode;

  void closeKeyboard() {
    focusScope.unfocus();
  }

  void safePop<T>([T? result]) {
    if (navigator.canPop()) navigator.pop(result);
  }

  Offset directionOffset({
    double dx = 0,
    double dy = 0,
    double? dxLtr,
    double? dxRtl,
  }) {
    return Offset(isRtl ? -(dxRtl ?? dx) : (dxLtr ?? dx), dy);
  }

  // snackbar
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar({
    required String message,
    Duration? duration,
    SnackBarAction? action,
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
  }) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        margin: EdgeInsets.all(8.rm),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: textTheme.bodyMedium?.copyWith(color: textColor),
        ),
        duration: duration ?? const Duration(seconds: 3),
        action: action,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.rm),
          side: BorderSide(color: borderColor ?? colors.grey300, width: 1),
        ),
      ),
    );
  }

  String ago(DateTime date) {
    return timeago.format(date, locale: localeLanguageCode);
  }

  bool isSameDay(DateTime one, DateTime two) {
    return one.year == two.year && one.month == two.month && one.day == two.day;
  }

  /// Shows [AppException] details in a modal (not a SnackBar), including
  /// Laravel 422 validation text and a dedicated validation title.
  void errorSnackBar(Object? error) {
    final ctx = this;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!ctx.mounted) return;
      await ctx.showErrorDialog(error);
    });
  }

  // dialog
  Future<T?> customWidgetDialog<T>(
    Widget child, {
    bool barrierDismissible = true,
  }) {
    return showModal<T>(
      context: this,
      builder: (context) => child,
      configuration: FadeScaleTransitionConfiguration(
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: barrierDismissible,
      ),
    );
  }

  // error dialog (uses [AppException]; 422 → validation title + API/validation body)
  Future<void> showErrorDialog(Object? error, {VoidCallback? onRefresh}) async {
    // final appException = AppException.fromDartException(error);
    // final title = appException.dioErrorCode == 422
    //     ? t.validation.apiErrorTitle
    //     : appException.title;

    // return customWidgetDialog(
    //   CustomDialog(
    //     title: title,
    //     content: appException.message,
    //     lottie: Assets.lottie.error,
    //     isActionsRow: false,
    //     actions: onRefresh == null
    //         ? [
    //             CustomButton(
    //               onPressed: () => this.safePop(),
    //               text: this.t.general.close,
    //               backgroundColor: colors.error.withValues(alpha: .1),
    //               foregroundColor: const Color.fromARGB(221, 60, 11, 11),
    //               strokeColor: colors.stroke,
    //             ),
    //           ]
    //         : [
    //             CustomButton(
    //               onPressed: () {
    //                 this.safePop();
    //                 onRefresh();
    //               },
    //               text: this.t.general.retry,
    //             ),
    //             CustomButton(
    //               onPressed: () => this.safePop(),
    //               backgroundColor: colors.transparent,
    //               foregroundColor: colors.textPrimary,
    //               strokeColor: colors.stroke,
    //               text: this.t.general.close,
    //             ),
    //           ],
    //   ),
    // );
  }

  Future<void> errorDialogFromMessage(String message) async {
    // return showErrorDialog(
    //   AppException(customMessage: message, type: AppExceptionType.custom),
    // );
  }

  Future<void> showSuccessDialog({
    String? message,
    List<Widget>? actions,
    bool addGoHomeButton = false,
  }) async {
    // return customWidgetDialog(
    // CustomDialog(
    //   title: this.t.general.success,
    //   content: message ?? this.t.general.operationCompletedSuccessfully,
    //   lottie: Assets.lottie.success,
    //   isActionsRow: false,
    //   actions:
    //       actions ??
    //       [
    //         CustomButton(
    //           onPressed: () => this.safePop(),
    //           text: this.t.general.close,
    //         ),
    //         if (addGoHomeButton)
    //           CustomButton(
    //             onPressed: () {
    //               // getIt<GoRouter>().pushNamed(Routes.home);
    //             },
    //             text: this.t.general.home,
    //           ),
    //       ],
    // ),
    // );
  }

  Future<T?> showBottomSheet<T>({
    required Widget child,
    Color? barrierColor,
  }) async {
    return showModalBottomSheet<T>(
      context: this,
      isScrollControlled: true,
      barrierColor: barrierColor,
      builder: (_) => child,
    );
  }
}
