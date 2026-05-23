import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/core/widgets/custom_loading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.text,
    this.icon,
    this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.strokeColor,
    this.strokeWeight,
    this.height,
    this.width,
    this.textStyle,
    this.isOutlined = false,
    this.isLoading = false,
    this.padding,
    this.gradient,
    this.borderRadius,
    this.oneLine = false,
  });

  final VoidCallback? onPressed;
  final String? text;
  final IconData? icon;
  final Widget? child;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final Color? strokeColor;
  final double? strokeWeight;
  final double? width;
  final double? height;
  final bool isOutlined;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  final Gradient? gradient;
  final BorderRadiusGeometry? borderRadius;
  final bool oneLine;

  @override
  Widget build(BuildContext context) {
    // you either provide one of the following:
    // - child only
    // - text only

    assert(child != null || text != null);

    Widget childWidget({bool showForground = true}) {
      if (child != null) {
        return child!;
      }

      if (icon != null) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon!,
              color: showForground ? foregroundColor : Colors.transparent,
              size: 16.rm,
            ),
            6.gapW,
            Text(
              text!,
              maxLines: oneLine ? 1 : null,
              overflow: oneLine ? TextOverflow.ellipsis : null,
              textAlign: TextAlign.center,
              style: showForground
                  ? null
                  : const TextStyle(
                      color: Colors.transparent,
                    ).merge(buildTextStyle),
            ),
          ],
        );
      }
      return Text(
        text!,
        maxLines: oneLine ? 1 : null,
        overflow: oneLine ? TextOverflow.ellipsis : null,
        textAlign: TextAlign.center,
        style: showForground
            ? null
            : const TextStyle(color: Colors.transparent).merge(buildTextStyle),
      );
    }

    final minimumSize = Size(width ?? 0, height ?? 0);
    final fixedSize = height == null || width == null
        ? null
        : Size(width!, height!);
    final padding =
        this.padding ??
        EdgeInsets.symmetric(horizontal: 20.wm, vertical: 10.hm);
    final side = strokeColor == null
        ? null
        : BorderSide(color: strokeColor!, width: strokeWeight ?? 1);

    final radius = borderRadius ?? BorderRadius.circular(12.r);

    Widget button({bool showForground = true}) {
      if (gradient != null) {
        return FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            minimumSize: minimumSize,
            fixedSize: fixedSize,
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            textStyle: showForground
                ? textStyle
                : const TextStyle(
                    color: Colors.transparent,
                  ).merge(buildTextStyle),
            shape: RoundedRectangleBorder(borderRadius: radius),
            elevation: 0,
            shadowColor: Colors.transparent,
          ),
          child: Ink(
            decoration: onPressed == null
                ? null
                : BoxDecoration(gradient: gradient, borderRadius: radius),
            child: Container(
              constraints: BoxConstraints(
                minWidth: minimumSize.width,
                minHeight: minimumSize.height,
              ),
              padding: padding,
              alignment: Alignment.center,
              child: childWidget(showForground: showForground),
            ),
          ),
        );
      } else if (isOutlined) {
        return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: showForground
                ? foregroundColor
                : Colors.transparent,
            disabledBackgroundColor: disabledBackgroundColor,
            disabledForegroundColor: disabledForegroundColor,
            minimumSize: minimumSize,
            fixedSize: fixedSize,
            padding: padding,
            side: side,
            textStyle: buildTextStyle,
            shape: RoundedRectangleBorder(borderRadius: radius),
          ),
          child: childWidget(showForground: showForground),
        );
      } else {
        return FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: showForground
                ? foregroundColor
                : Colors.transparent,
            disabledBackgroundColor: disabledBackgroundColor,
            disabledForegroundColor: disabledForegroundColor,
            minimumSize: minimumSize,
            fixedSize: fixedSize,
            padding: padding,
            side: side,
            textStyle: buildTextStyle,
            shape: RoundedRectangleBorder(borderRadius: radius),
          ),
          child: childWidget(showForground: showForground),
        );
      }
    }

    if (isLoading) {
      return Stack(
        alignment: Alignment.center,
        fit: StackFit.passthrough,
        children: [
          IgnorePointer(
            child: Opacity(opacity: 0.3, child: button(showForground: false)),
          ),
          Positioned.fill(
            child: Center(
              child: CustomLoading(
                strokeWidth: 2,
                color:
                    (backgroundColor == Colors.transparent
                        ? foregroundColor
                        : backgroundColor) ??
                    context.colors.primary,
              ),
            ),
          ),
        ],
      );
    } else {
      return button();
    }
  }

  TextStyle get buildTextStyle =>
      textStyle ?? TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600);
}
