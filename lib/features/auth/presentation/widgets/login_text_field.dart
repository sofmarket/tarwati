import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
  });

  final String label;
  final String hint;
  final IconData prefixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.spMin,
            fontWeight: FontWeight.w700,
            color: context.colors.textPrimary,
          ),
        ),
        8.gapH,
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: TextStyle(
            fontSize: 14.spMin,
            fontWeight: FontWeight.w400,
            color: context.colors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 14.spMin,
              fontWeight: FontWeight.w400,
              color: context.colors.textTertiary,
            ),
            prefixIcon: Icon(
              prefixIcon,
              color: context.colors.textTertiary,
              size: 20.r,
            ),
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: context.colors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: context.colors.grey250),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: context.colors.primary, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}

class LoginPasswordField extends StatefulWidget {
  const LoginPasswordField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<LoginPasswordField> createState() => _LoginPasswordFieldState();
}

class _LoginPasswordFieldState extends State<LoginPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return LoginTextField(
      label: 'Password',
      hint: 'Enter your password',
      prefixIcon: Icons.lock_outline_rounded,
      controller: widget.controller,
      obscureText: _obscureText,
      suffixIcon: IconButton(
        onPressed: () => setState(() => _obscureText = !_obscureText),
        icon: Icon(
          _obscureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: context.colors.textTertiary,
          size: 20.r,
        ),
      ),
    );
  }
}
