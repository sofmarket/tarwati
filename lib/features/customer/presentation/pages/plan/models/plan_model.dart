import 'package:flutter/material.dart';

class PlanAllocationItem {
  const PlanAllocationItem({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.progressColor,
    required this.percentage,
    required this.monthlyAmount,
  });

  final String title;
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final Color progressColor;
  final int percentage;
  final String monthlyAmount;
}

class PlanMilestoneItem {
  const PlanMilestoneItem({
    required this.title,
    required this.targetDate,
    required this.amount,
    required this.progress,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.progressColor,
  });

  final String title;
  final String targetDate;
  final String amount;
  final double progress;
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final Color progressColor;
}

const planTabs = ['Overview', 'Breakdown', 'Recommendations'];

const planAllocations = [
  PlanAllocationItem(
    title: 'Investments',
    icon: Icons.show_chart_rounded,
    iconColor: Color(0xFF449C47),
    iconBackgroundColor: Color(0xFFE8F5E9),
    progressColor: Color(0xFF449C47),
    percentage: 40,
    monthlyAmount: '\$5,010',
  ),
  PlanAllocationItem(
    title: 'Savings',
    icon: Icons.savings_rounded,
    iconColor: Color(0xFF2196F3),
    iconBackgroundColor: Color(0xFFE3F2FD),
    progressColor: Color(0xFF2196F3),
    percentage: 25,
    monthlyAmount: '\$3,130',
  ),
  PlanAllocationItem(
    title: 'Debt Payoff',
    icon: Icons.account_balance_wallet_rounded,
    iconColor: Color(0xFFFF9800),
    iconBackgroundColor: Color(0xFFFFF3E0),
    progressColor: Color(0xFFFF9800),
    percentage: 15,
    monthlyAmount: '\$1,880',
  ),
  PlanAllocationItem(
    title: 'Insurance',
    icon: Icons.shield_rounded,
    iconColor: Color(0xFF563CEC),
    iconBackgroundColor: Color(0xFFEEEAFD),
    progressColor: Color(0xFF563CEC),
    percentage: 10,
    monthlyAmount: '\$1,250',
  ),
  PlanAllocationItem(
    title: 'Lifestyle',
    icon: Icons.shopping_bag_rounded,
    iconColor: Color(0xFFFCC72C),
    iconBackgroundColor: Color(0xFFFFF8E1),
    progressColor: Color(0xFFFCC72C),
    percentage: 10,
    monthlyAmount: '\$1,250',
  ),
];

const planMilestones = [
  PlanMilestoneItem(
    title: 'Vacation in Bali',
    targetDate: 'Dec 2025',
    amount: '\$3,200',
    progress: 0.8,
    icon: Icons.beach_access_rounded,
    iconColor: Color(0xFF449C47),
    iconBackgroundColor: Color(0xFFE8F5E9),
    progressColor: Color(0xFF449C47),
  ),
  PlanMilestoneItem(
    title: 'Buy Your First Home',
    targetDate: 'Jun 2028',
    amount: '\$45,000',
    progress: 0.65,
    icon: Icons.home_rounded,
    iconColor: Color(0xFF563CEC),
    iconBackgroundColor: Color(0xFFEEEAFD),
    progressColor: Color(0xFF563CEC),
  ),
];
