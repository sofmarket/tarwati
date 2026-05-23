import 'package:flutter/material.dart';

class GoalModel {
  const GoalModel({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.targetAmount,
    required this.targetDate,
    this.isEnabled = true,
  });

  final String title;
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String targetAmount;
  final String targetDate;
  final bool isEnabled;

  GoalModel copyWith({bool? isEnabled}) {
    return GoalModel(
      title: title,
      icon: icon,
      iconColor: iconColor,
      iconBackgroundColor: iconBackgroundColor,
      targetAmount: targetAmount,
      targetDate: targetDate,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
}

const initialGoals = [
  GoalModel(
    title: 'Buy a Home',
    icon: Icons.home_rounded,
    iconColor: Color(0xFF563CEC),
    iconBackgroundColor: Color(0xFFEEEAFD),
    targetAmount: '\$ 120,000',
    targetDate: 'Jun 2030',
  ),
  GoalModel(
    title: 'Retirement',
    icon: Icons.weekend_rounded,
    iconColor: Color(0xFF449C47),
    iconBackgroundColor: Color(0xFFE8F5E9),
    targetAmount: '\$ 1,000,000',
    targetDate: 'Jun 2045',
  ),
  GoalModel(
    title: 'Travel the World',
    icon: Icons.flight_rounded,
    iconColor: Color(0xFF2196F3),
    iconBackgroundColor: Color(0xFFE3F2FD),
    targetAmount: '\$ 20,000',
    targetDate: 'Dec 2026',
  ),
  GoalModel(
    title: 'Emergency Fund',
    icon: Icons.shield_rounded,
    iconColor: Color(0xFFFF9800),
    iconBackgroundColor: Color(0xFFFFF3E0),
    targetAmount: '\$ 15,000',
    targetDate: '—',
  ),
];
