import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tarwati/core/routing/routes.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/core/widgets/custom_app_bar.dart';
import 'package:tarwati/core/widgets/custom_scaffold.dart';
import 'package:tarwati/features/customer/presentation/pages/home/widgets/customer_bottom_nav_widget.dart';
import 'package:tarwati/features/shared/presentation/pages/notifications/models/notification_model.dart';
import 'package:tarwati/gen/assets.gen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int _selectedFilterIndex = 0;

  List<AppNotification> get _filteredNotifications {
    switch (_selectedFilterIndex) {
      case 1:
        return notificationsList
            .where((n) => n.category == NotificationCategory.alert)
            .toList();
      case 2:
        return notificationsList
            .where((n) => n.category == NotificationCategory.reminder)
            .toList();
      case 3:
        return notificationsList
            .where((n) => n.category == NotificationCategory.update)
            .toList();
      default:
        return notificationsList;
    }
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredNotifications;
    final todayNotifications = filtered
        .where((n) => n.group == NotificationGroup.today)
        .toList();
    final yesterdayNotifications = filtered
        .where((n) => n.group == NotificationGroup.yesterday)
        .toList();

    return CustomScaffold(
      hasSafeArea: true,
      backgroundColor: context.colors.white,
      statusBarColor: context.colors.white,
      appBar: CustomAppBar(
        title: const Text('Notifications'),
        centerTitle: true,
        backgroundColor: context.colors.white,
        actions: [
          IconButton(
            onPressed: () => context.pushNamed(Routes.preferences.name),
            icon: SvgPicture.asset(
              Assets.icons.settings,
              width: 22.r,
              height: 22.r,
              colorFilter: ColorFilter.mode(
                context.colors.textPrimary,
                BlendMode.srcIn,
              ),
            ),
          ),
          8.gapW,
        ],
      ),
      bottomNavigationBar: const CustomerBottomNavWidget(currentIndex: 4),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 16.h),
            child: _NotificationFilterChips(
              selectedIndex: _selectedFilterIndex,
              onSelected: (index) {
                setState(() => _selectedFilterIndex = index);
              },
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? _EmptyNotificationsView()
                : ListView(
                    padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 24.h),
                    children: [
                      if (todayNotifications.isNotEmpty) ...[
                        _NotificationGroupHeader(title: 'Today'),
                        12.gapH,
                        ...todayNotifications.map(
                          (notification) => Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: _NotificationCard(
                              notification: notification,
                            ),
                          ),
                        ),
                      ],
                      if (yesterdayNotifications.isNotEmpty) ...[
                        if (todayNotifications.isNotEmpty) 6.gapH,
                        _NotificationGroupHeader(title: 'Yesterday'),
                        12.gapH,
                        ...yesterdayNotifications.map(
                          (notification) => Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: _NotificationCard(
                              notification: notification,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _NotificationFilterChips extends StatelessWidget {
  const _NotificationFilterChips({
    required this.selectedIndex,
    required this.onSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: notificationFilters.length,
        separatorBuilder: (_, __) => 8.gapW,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onSelected(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected
                    ? context.colors.primary
                    : context.colors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: isSelected
                      ? context.colors.primary
                      : context.colors.grey250,
                ),
              ),
              child: Text(
                notificationFilters[index],
                style: TextStyle(
                  fontSize: 13.spMin,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? context.colors.white
                      : context.colors.textSecondary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _NotificationGroupHeader extends StatelessWidget {
  const _NotificationGroupHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.spMin,
        fontWeight: FontWeight.w700,
        color: context.colors.textPrimary,
      ),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({required this.notification});

  final AppNotification notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: context.colors.primary.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: context.colors.primary.withValues(alpha: 0.06),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44.r,
            height: 44.r,
            decoration: BoxDecoration(
              color: notification.iconBackgroundColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(
              notification.icon,
              size: 22.r,
              color: notification.iconColor,
            ),
          ),
          12.gapW,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        notification.title,
                        style: TextStyle(
                          fontSize: 14.spMin,
                          fontWeight: FontWeight.w700,
                          color: context.colors.textPrimary,
                        ),
                      ),
                    ),
                    8.gapW,
                    Text(
                      notification.timeLabel,
                      style: TextStyle(
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w500,
                        color: context.colors.textTertiary,
                      ),
                    ),
                    if (notification.isUnread) ...[
                      6.gapW,
                      Container(
                        width: 8.r,
                        height: 8.r,
                        margin: EdgeInsets.only(top: 4.h),
                        decoration: BoxDecoration(
                          color: context.colors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ],
                ),
                6.gapH,
                Text(
                  notification.message,
                  style: TextStyle(
                    fontSize: 13.spMin,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyNotificationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_none_rounded,
              size: 48.r,
              color: context.colors.textTertiary,
            ),
            12.gapH,
            Text(
              'No notifications',
              style: TextStyle(
                fontSize: 16.spMin,
                fontWeight: FontWeight.w600,
                color: context.colors.textPrimary,
              ),
            ),
            6.gapH,
            Text(
              'You are all caught up for this filter.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.spMin,
                fontWeight: FontWeight.w400,
                color: context.colors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
