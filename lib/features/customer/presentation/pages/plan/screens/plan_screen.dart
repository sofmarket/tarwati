import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/core/widgets/custom_app_bar.dart';
import 'package:tarwati/core/widgets/custom_scaffold.dart';
import 'package:tarwati/features/customer/presentation/pages/home/widgets/customer_bottom_nav_widget.dart';
import 'package:tarwati/features/customer/presentation/pages/plan/models/plan_model.dart';
import 'package:tarwati/features/customer/presentation/pages/plan/widgets/financial_allocation_widget.dart';
import 'package:tarwati/features/customer/presentation/pages/plan/widgets/key_recommendation_card_widget.dart';
import 'package:tarwati/features/customer/presentation/pages/plan/widgets/milestones_section_widget.dart';
import 'package:tarwati/features/customer/presentation/pages/plan/widgets/plan_tabs_widget.dart';
import 'package:tarwati/features/customer/presentation/pages/plan/widgets/projected_wealth_card_widget.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: Text('Your Financial Plan'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_rounded,
              size: 24.r,
              color: context.colors.textPrimary,
            ),
          ),
          8.gapW,
        ],
      ),
      hasSafeArea: true,
      backgroundColor: context.colors.white,
      statusBarColor: context.colors.white,
      bottomNavigationBar: CustomerBottomNavWidget(currentIndex: 1),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProjectedWealthCardWidget(),
            20.gapH,
            PlanTabsWidget(
              tabs: planTabs,
              selectedIndex: _selectedTabIndex,
              onSelected: (index) {
                setState(() => _selectedTabIndex = index);
              },
            ),
            20.gapH,
            if (_selectedTabIndex == 0) ...[
              const FinancialAllocationWidget(items: planAllocations),
              16.gapH,
              const KeyRecommendationCardWidget(),
              24.gapH,
              const MilestonesSectionWidget(milestones: planMilestones),
            ] else
              _TabPlaceholder(tabName: planTabs[_selectedTabIndex]),
          ],
        ),
      ),
    );
  }
}

class _TabPlaceholder extends StatelessWidget {
  const _TabPlaceholder({required this.tabName});

  final String tabName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 48.h),
      alignment: Alignment.center,
      child: Text(
        '$tabName content coming soon',
        style: TextStyle(
          fontSize: 14.spMin,
          fontWeight: FontWeight.w500,
          color: context.colors.textTertiary,
        ),
      ),
    );
  }
}
