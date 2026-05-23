import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/core/widgets/custom_app_bar.dart';
import 'package:tarwati/core/widgets/custom_scaffold.dart';
import 'package:tarwati/features/customer/presentation/pages/goals/models/goal_model.dart';
import 'package:tarwati/features/customer/presentation/pages/goals/widgets/goal_card_widget.dart';
import 'package:tarwati/features/customer/presentation/pages/goals/widgets/goals_progress_header_widget.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  static const _currentStep = 2;
  static const _totalSteps = 4;

  late List<GoalModel> _goals;

  @override
  void initState() {
    super.initState();
    _goals = List<GoalModel>.from(initialGoals);
  }

  void _toggleGoal(int index, bool value) {
    setState(() {
      _goals[index] = _goals[index].copyWith(isEnabled: value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: Text('Tell us your goals'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Center(
              child: Text(
                'Step $_currentStep of $_totalSteps',
                style: TextStyle(
                  fontSize: 13.spMin,
                  fontWeight: FontWeight.w500,
                  color: context.colors.textTertiary,
                ),
              ),
            ),
          ),
        ],
      ),
      hasSafeArea: true,
      backgroundColor: context.colors.white,
      statusBarColor: context.colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GoalsProgressHeaderWidget(
                    currentStep: _currentStep,
                    totalSteps: _totalSteps,
                  ),
                  20.gapH,
                  ...List.generate(_goals.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: index == _goals.length - 1 ? 0 : 12.h,
                      ),
                      child: GoalCardWidget(
                        goal: _goals[index],
                        onToggle: (value) => _toggleGoal(index, value),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 16.h),
            child: Material(
              color: context.colors.transparent,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(14.r),
                child: Ink(
                  width: double.infinity,
                  height: 52.h,
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 16.spMin,
                          fontWeight: FontWeight.w600,
                          color: context.colors.white,
                        ),
                      ),
                      Positioned(
                        right: 20.w,
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          size: 22.r,
                          color: context.colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
