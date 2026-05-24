import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/core/widgets/custom_app_bar.dart';
import 'package:tarwati/core/widgets/custom_scaffold.dart';
import 'package:tarwati/features/customer/presentation/pages/home/widgets/customer_bottom_nav_widget.dart';
import 'package:tarwati/gen/assets.gen.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  String _language = 'English';
  String _currency = 'AED - UAE Dirham';
  String _dateFormat = 'DD MMM YYYY';
  String _theme = 'System Default';

  bool _biometricLogin = true;
  bool _expenseReminders = true;
  bool _budgetAlerts = true;
  bool _goalReminders = true;
  bool _marketingCommunications = false;

  Future<void> _showOptionsSheet({
    required String title,
    required List<String> options,
    required String currentValue,
    required ValueChanged<String> onSelected,
  }) async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: context.colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.spMin,
                    fontWeight: FontWeight.w700,
                    color: context.colors.textPrimary,
                  ),
                ),
              ),
              ...options.map(
                (option) => ListTile(
                  title: Text(option),
                  trailing: option == currentValue
                      ? Icon(Icons.check_rounded, color: context.colors.primary)
                      : null,
                  onTap: () => Navigator.pop(context, option),
                ),
              ),
              8.gapH,
            ],
          ),
        );
      },
    );

    if (selected != null) {
      onSelected(selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasSafeArea: true,
      backgroundColor: context.colors.bg,
      statusBarColor: context.colors.white,
      appBar: CustomAppBar(
        title: const Text('Preferences'),
        centerTitle: true,
        backgroundColor: context.colors.white,
      ),
      bottomNavigationBar: const CustomerBottomNavWidget(currentIndex: 4),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _PreferencesSection(
              title: 'General',
              children: [
                _PreferenceDropdownRow(
                  icon: Icons.language_rounded,
                  title: 'Language',
                  value: _language,
                  onTap: () => _showOptionsSheet(
                    title: 'Language',
                    options: const ['English', 'Arabic', 'French'],
                    currentValue: _language,
                    onSelected: (value) => setState(() => _language = value),
                  ),
                ),
                _PreferenceDropdownRow(
                  icon: Icons.payments_outlined,
                  title: 'Currency',
                  value: _currency,
                  onTap: () => _showOptionsSheet(
                    title: 'Currency',
                    options: const [
                      'AED - UAE Dirham',
                      'SAR - Saudi Riyal',
                      'USD - US Dollar',
                    ],
                    currentValue: _currency,
                    onSelected: (value) => setState(() => _currency = value),
                  ),
                ),
                _PreferenceDropdownRow(
                  iconPath: Assets.icons.calendar,
                  title: 'Date Format',
                  value: _dateFormat,
                  onTap: () => _showOptionsSheet(
                    title: 'Date Format',
                    options: const ['DD MMM YYYY', 'MM/DD/YYYY', 'YYYY-MM-DD'],
                    currentValue: _dateFormat,
                    onSelected: (value) => setState(() => _dateFormat = value),
                  ),
                ),
                _PreferenceDropdownRow(
                  iconPath: Assets.icons.sun,
                  title: 'Theme',
                  value: _theme,
                  showDivider: false,
                  onTap: () => _showOptionsSheet(
                    title: 'Theme',
                    options: const ['System Default', 'Light', 'Dark'],
                    currentValue: _theme,
                    onSelected: (value) => setState(() => _theme = value),
                  ),
                ),
              ],
            ),
            24.gapH,
            _PreferencesSection(
              title: 'App Preferences',
              children: [
                _PreferenceToggleRow(
                  icon: Icons.fingerprint_rounded,
                  title: 'Biometric Login',
                  subtitle: 'Login using fingerprint or Face ID',
                  value: _biometricLogin,
                  onChanged: (value) =>
                      setState(() => _biometricLogin = value),
                ),
                _PreferenceToggleRow(
                  iconPath: Assets.icons.alarm,
                  title: 'Expense Reminders',
                  subtitle: 'Get reminded to add expenses',
                  value: _expenseReminders,
                  onChanged: (value) =>
                      setState(() => _expenseReminders = value),
                ),
                _PreferenceToggleRow(
                  iconPath: Assets.icons.warningCircle,
                  title: 'Budget Alerts',
                  subtitle: 'Receive alerts when budget is exceeded',
                  value: _budgetAlerts,
                  onChanged: (value) => setState(() => _budgetAlerts = value),
                ),
                _PreferenceToggleRow(
                  iconPath: Assets.icons.bell,
                  title: 'Goal Reminders',
                  subtitle: 'Receive reminders for your goals',
                  value: _goalReminders,
                  onChanged: (value) => setState(() => _goalReminders = value),
                ),
                _PreferenceToggleRow(
                  icon: Icons.mail_outline_rounded,
                  title: 'Marketing Communications',
                  subtitle: 'Receive tips and offers',
                  value: _marketingCommunications,
                  showDivider: false,
                  onChanged: (value) =>
                      setState(() => _marketingCommunications = value),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PreferencesSection extends StatelessWidget {
  const _PreferencesSection({
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.spMin,
            fontWeight: FontWeight.w700,
            color: context.colors.textPrimary,
          ),
        ),
        12.gapH,
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: context.colors.grey250),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }
}

class _PreferenceIcon extends StatelessWidget {
  const _PreferenceIcon({
    this.icon,
    this.iconPath,
  }) : assert(icon != null || iconPath != null);

  final IconData? icon;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.r,
      height: 40.r,
      decoration: BoxDecoration(
        color: context.colors.primary.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: iconPath != null
          ? SvgPicture.asset(
              iconPath!,
              width: 20.r,
              height: 20.r,
              colorFilter: ColorFilter.mode(
                context.colors.primary,
                BlendMode.srcIn,
              ),
            )
          : Icon(
              icon,
              size: 20.r,
              color: context.colors.primary,
            ),
    );
  }
}

class _PreferenceDropdownRow extends StatelessWidget {
  const _PreferenceDropdownRow({
    required this.title,
    required this.value,
    required this.onTap,
    this.icon,
    this.iconPath,
    this.showDivider = true,
  }) : assert(icon != null || iconPath != null);

  final String title;
  final String value;
  final VoidCallback onTap;
  final IconData? icon;
  final String? iconPath;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: context.colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              child: Row(
                children: [
                  _PreferenceIcon(icon: icon, iconPath: iconPath),
                  12.gapW,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 14.spMin,
                            fontWeight: FontWeight.w700,
                            color: context.colors.textPrimary,
                          ),
                        ),
                        2.gapH,
                        Text(
                          value,
                          style: TextStyle(
                            fontSize: 12.spMin,
                            fontWeight: FontWeight.w400,
                            color: context.colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 22.r,
                    color: context.colors.textPrimary,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            thickness: 1,
            indent: 68.w,
            color: context.colors.grey150,
          ),
      ],
    );
  }
}

class _PreferenceToggleRow extends StatelessWidget {
  const _PreferenceToggleRow({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.icon,
    this.iconPath,
    this.showDivider = true,
  }) : assert(icon != null || iconPath != null);

  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final IconData? icon;
  final String? iconPath;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: Row(
            children: [
              _PreferenceIcon(icon: icon, iconPath: iconPath),
              12.gapW,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.spMin,
                        fontWeight: FontWeight.w700,
                        color: context.colors.textPrimary,
                      ),
                    ),
                    2.gapH,
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w400,
                        color: context.colors.textSecondary,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              Switch.adaptive(
                value: value,
                onChanged: onChanged,
                activeTrackColor: context.colors.primary,
                activeThumbColor: context.colors.white,
                inactiveTrackColor: context.colors.grey250,
                inactiveThumbColor: context.colors.white,
              ),
            ],
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            thickness: 1,
            indent: 68.w,
            color: context.colors.grey150,
          ),
      ],
    );
  }
}
