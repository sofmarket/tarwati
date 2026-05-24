import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tarwati/core/routing/routes.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/core/widgets/custom_button.dart';
import 'package:tarwati/core/widgets/custom_scaffold.dart';
import 'package:tarwati/features/customer/presentation/pages/experts/models/expert_model.dart';
import 'package:tarwati/features/customer/presentation/pages/experts/widgets/expert_details_header_widget.dart';
import 'package:tarwati/gen/assets.gen.dart';

class ExpertDetailsScreen extends StatefulWidget {
  const ExpertDetailsScreen({
    super.key,
    this.expert,
  });

  final ExpertModel? expert;

  @override
  State<ExpertDetailsScreen> createState() => _ExpertDetailsScreenState();
}

class _ExpertDetailsScreenState extends State<ExpertDetailsScreen> {
  bool _isAboutExpanded = false;
  bool _isFavorite = false;

  ExpertModel get _expert => widget.expert ?? expertsList.first;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: context.colors.white,
      statusBarColor: context.colors.primaryDarkest,
      body: Column(
        children: [
          ExpertDetailsHeaderWidget(expert: _expert),
          Expanded(
            child: Transform.translate(
              offset: Offset(0, -20.h),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(28.r),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _AboutSection(
                        expert: _expert,
                        isExpanded: _isAboutExpanded,
                        onToggle: () {
                          setState(() => _isAboutExpanded = !_isAboutExpanded);
                        },
                      ),
                      16.gapH,
                      _StatsSection(expert: _expert),
                      24.gapH,
                      _ExpertiseSection(expert: _expert),
                      24.gapH,
                      _SessionFeesSection(expert: _expert),
                      100.gapH,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _BottomActionBar(
        isFavorite: _isFavorite,
        onBookAppointment: () {
          context.pushNamed(
            Routes.expertAppointment.name,
            extra: _expert,
          );
        },
        onToggleFavorite: () {
          setState(() => _isFavorite = !_isFavorite);
        },
      ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection({
    required this.expert,
    required this.isExpanded,
    required this.onToggle,
  });

  final ExpertModel expert;
  final bool isExpanded;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final aboutText = expert.about.isNotEmpty
        ? expert.about
        : '${expert.name} is a ${expert.title} with ${expert.yearsExperience}+ years of experience.';

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.colors.grey250),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About ${expert.firstName}',
            style: TextStyle(
              fontSize: 16.spMin,
              fontWeight: FontWeight.w700,
              color: context.colors.textPrimary,
            ),
          ),
          10.gapH,
          Text(
            aboutText,
            maxLines: isExpanded ? null : 3,
            overflow: isExpanded ? null : TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13.spMin,
              fontWeight: FontWeight.w400,
              height: 1.5,
              color: context.colors.textSecondary,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: onToggle,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                isExpanded ? 'Less' : 'More',
                style: TextStyle(
                  fontSize: 13.spMin,
                  fontWeight: FontWeight.w600,
                  color: context.colors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsSection extends StatelessWidget {
  const _StatsSection({required this.expert});

  final ExpertModel expert;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.colors.grey250),
      ),
      child: Row(
        children: [
          Expanded(
            child: _StatItem(
              iconPath: Assets.icons.cam,
              iconColor: context.colors.primary,
              value: '${expert.reviewCount}',
              label: 'Reviews',
            ),
          ),
          Expanded(
            child: _StatItem(
              iconPath: Assets.icons.clock,
              iconColor: context.colors.primary,
              value: '${expert.sessionCount}+',
              label: 'Sessions',
            ),
          ),
          Expanded(
            child: _StatItem(
              iconPath: Assets.icons.checkCircle,
              iconColor: context.colors.success,
              value: '${expert.satisfactionRate}%',
              label: 'Satisfaction',
            ),
          ),
          Expanded(
            child: _StatItem(
              iconPath: Assets.icons.users,
              iconColor: context.colors.primary,
              value: '${expert.yearsExperience}+',
              label: 'Years Exp.',
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.iconPath,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  final String iconPath;
  final Color iconColor;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          iconPath,
          width: 20.r,
          height: 20.r,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
        8.gapH,
        Text(
          value,
          style: TextStyle(
            fontSize: 14.spMin,
            fontWeight: FontWeight.w700,
            color: context.colors.textPrimary,
          ),
        ),
        2.gapH,
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11.spMin,
            fontWeight: FontWeight.w400,
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _ExpertiseSection extends StatelessWidget {
  const _ExpertiseSection({required this.expert});

  final ExpertModel expert;

  @override
  Widget build(BuildContext context) {
    final areas = expert.expertiseAreas.isNotEmpty
        ? expert.expertiseAreas
        : expert.tags;
    final midpoint = (areas.length / 2).ceil();
    final leftColumn = areas.take(midpoint).toList();
    final rightColumn = areas.skip(midpoint).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Areas of Expertise',
          style: TextStyle(
            fontSize: 16.spMin,
            fontWeight: FontWeight.w700,
            color: context.colors.textPrimary,
          ),
        ),
        14.gapH,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: leftColumn
                    .map(
                      (area) => _ExpertiseItem(
                        label: area,
                        color: context.colors.primary,
                      ),
                    )
                    .toList(),
              ),
            ),
            12.gapW,
            Expanded(
              child: Column(
                children: rightColumn
                    .map(
                      (area) => _ExpertiseItem(
                        label: area,
                        color: context.colors.success,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ExpertiseItem extends StatelessWidget {
  const _ExpertiseItem({
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_rounded,
            size: 18.r,
            color: color,
          ),
          8.gapW,
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13.spMin,
                fontWeight: FontWeight.w500,
                color: context.colors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SessionFeesSection extends StatelessWidget {
  const _SessionFeesSection({required this.expert});

  final ExpertModel expert;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Session Fees',
          style: TextStyle(
            fontSize: 16.spMin,
            fontWeight: FontWeight.w700,
            color: context.colors.textPrimary,
          ),
        ),
        14.gapH,
        Row(
          children: [
            Expanded(
              child: _SessionFeeCard(
                iconPath: Assets.icons.cam,
                iconBackgroundColor: context.colors.primary.withValues(
                  alpha: 0.1,
                ),
                iconColor: context.colors.primary,
                title: 'Video Session',
                price: expert.pricePerSession,
                durationMinutes: expert.sessionDurationMinutes,
              ),
            ),
            12.gapW,
            Expanded(
              child: _SessionFeeCard(
                iconPath: Assets.icons.phone,
                iconBackgroundColor: context.colors.success.withValues(
                  alpha: 0.12,
                ),
                iconColor: context.colors.successDarker,
                title: 'Audio Session',
                price: expert.audioSessionPrice,
                durationMinutes: expert.sessionDurationMinutes,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SessionFeeCard extends StatelessWidget {
  const _SessionFeeCard({
    required this.iconPath,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.title,
    required this.price,
    required this.durationMinutes,
  });

  final String iconPath;
  final Color iconBackgroundColor;
  final Color iconColor;
  final String title;
  final int price;
  final int durationMinutes;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: context.colors.grey250),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              iconPath,
              width: 20.r,
              height: 20.r,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
          ),
          10.gapH,
          Text(
            title,
            style: TextStyle(
              fontSize: 13.spMin,
              fontWeight: FontWeight.w700,
              color: context.colors.textPrimary,
            ),
          ),
          4.gapH,
          Text(
            '\$$price / $durationMinutes min',
            style: TextStyle(
              fontSize: 12.spMin,
              fontWeight: FontWeight.w400,
              color: context.colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomActionBar extends StatelessWidget {
  const _BottomActionBar({
    required this.isFavorite,
    required this.onBookAppointment,
    required this.onToggleFavorite,
  });

  final bool isFavorite;
  final VoidCallback onBookAppointment;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 24.h),
      decoration: BoxDecoration(
        color: context.colors.white,
        boxShadow: [
          BoxShadow(
            color: context.colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                onPressed: onBookAppointment,
                backgroundColor: context.colors.primary,
                foregroundColor: context.colors.white,
                height: 52.h,
                borderRadius: BorderRadius.circular(14.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.calendar,
                      width: 20.r,
                      height: 20.r,
                      colorFilter: ColorFilter.mode(
                        context.colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    8.gapW,
                    Text(
                      'Book an Appointment',
                      style: TextStyle(
                        fontSize: 15.spMin,
                        fontWeight: FontWeight.w600,
                        color: context.colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            12.gapW,
            Material(
              color: context.colors.transparent,
              child: InkWell(
                onTap: onToggleFavorite,
                borderRadius: BorderRadius.circular(14.r),
                child: Ink(
                  width: 52.r,
                  height: 52.r,
                  decoration: BoxDecoration(
                    color: context.colors.white,
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(color: context.colors.grey250),
                  ),
                  child: Icon(
                    isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                    size: 24.r,
                    color: context.colors.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
