import 'package:flutter/material.dart';

enum NotificationCategory { alert, reminder, update }

enum NotificationGroup { today, yesterday }

class AppNotification {
  const AppNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.timeLabel,
    required this.category,
    required this.group,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    this.isUnread = false,
  });

  final String id;
  final String title;
  final String message;
  final String timeLabel;
  final NotificationCategory category;
  final NotificationGroup group;
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final bool isUnread;
}

const notificationsList = [
  AppNotification(
    id: '1',
    title: 'Budget Alert',
    message:
        'You have exceeded your dining budget for this month. Consider adjusting your spending.',
    timeLabel: '10:30 AM',
    category: NotificationCategory.alert,
    group: NotificationGroup.today,
    icon: Icons.home_work_outlined,
    iconColor: Color(0xFFE53935),
    iconBackgroundColor: Color(0xFFFFEBEE),
    isUnread: true,
  ),
  AppNotification(
    id: '2',
    title: 'Goal Milestone',
    message:
        "Congratulations! You've reached 50% of your Emergency Fund goal.",
    timeLabel: '9:15 AM',
    category: NotificationCategory.update,
    group: NotificationGroup.today,
    icon: Icons.emoji_events_outlined,
    iconColor: Color(0xFF43A047),
    iconBackgroundColor: Color(0xFFE8F5E9),
    isUnread: true,
  ),
  AppNotification(
    id: '3',
    title: 'Expert Reminder',
    message: 'Your session with Omar Al-Harbi starts in 1 hour.',
    timeLabel: '8:00 AM',
    category: NotificationCategory.reminder,
    group: NotificationGroup.today,
    icon: Icons.person_outline_rounded,
    iconColor: Color(0xFF563CEC),
    iconBackgroundColor: Color(0xFFEEEAFD),
  ),
  AppNotification(
    id: '4',
    title: 'Investment Update',
    message: 'Your portfolio gained 2.3% this week. Review your performance.',
    timeLabel: 'Yesterday',
    category: NotificationCategory.update,
    group: NotificationGroup.yesterday,
    icon: Icons.auto_awesome_outlined,
    iconColor: Color(0xFFF9A825),
    iconBackgroundColor: Color(0xFFFFF8E1),
    isUnread: true,
  ),
];

const notificationFilters = ['All', 'Alerts', 'Reminders', 'Updates'];
