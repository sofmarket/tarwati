import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/core/widgets/custom_app_bar.dart';
import 'package:tarwati/core/widgets/custom_scaffold.dart';
import 'package:tarwati/features/customer/presentation/pages/experts/models/expert_model.dart';
import 'package:tarwati/features/customer/presentation/pages/experts/widgets/expert_card_widget.dart';
import 'package:tarwati/features/customer/presentation/pages/experts/widgets/experts_category_filter_widget.dart';
import 'package:tarwati/features/customer/presentation/pages/experts/widgets/experts_header_widget.dart';
import 'package:tarwati/features/customer/presentation/pages/experts/widgets/get_matched_banner_widget.dart';
import 'package:tarwati/features/customer/presentation/pages/home/widgets/customer_bottom_nav_widget.dart';

class ExpertsScreen extends StatefulWidget {
  const ExpertsScreen({super.key});

  @override
  State<ExpertsScreen> createState() => _ExpertsScreenState();
}

class _ExpertsScreenState extends State<ExpertsScreen> {
  int _selectedCategoryIndex = 0;

  List<ExpertModel> get _filteredExperts {
    if (_selectedCategoryIndex == 0) return expertsList;

    final category = expertCategories[_selectedCategoryIndex];
    return expertsList.where((expert) {
      return expert.tags.any(
        (tag) => tag.toLowerCase().contains(category.toLowerCase()),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredExperts = _filteredExperts;

    return CustomScaffold(
      appBar: CustomAppBar(
        title: Text('Connect with Experts'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.filter_list_rounded,
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
      bottomNavigationBar: CustomerBottomNavWidget(currentIndex: 3),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ExpertsHeaderWidget(),
            24.gapH,
            ExpertsCategoryFilterWidget(
              categories: expertCategories,
              selectedIndex: _selectedCategoryIndex,
              onSelected: (index) {
                setState(() => _selectedCategoryIndex = index);
              },
            ),
            20.gapH,
            ...List.generate(filteredExperts.length, (index) {
              final expert = filteredExperts[index];
              return Padding(
                padding: EdgeInsets.only(
                  bottom: index == filteredExperts.length - 1 ? 0 : 12.h,
                ),
                child: ExpertCardWidget(expert: expert, onBookNow: () {}),
              );
            }),
            20.gapH,
            const GetMatchedBannerWidget(),
          ],
        ),
      ),
    );
  }
}
