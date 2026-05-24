import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/core/widgets/custom_app_bar.dart';
import 'package:tarwati/core/widgets/custom_button.dart';
import 'package:tarwati/core/widgets/custom_scaffold.dart';
import 'package:tarwati/features/customer/presentation/pages/experts/models/expert_model.dart';
import 'package:tarwati/gen/assets.gen.dart';

enum SessionType { video, audio }

class ExpertAppointmentScreen extends StatefulWidget {
  const ExpertAppointmentScreen({super.key, this.expert});

  final ExpertModel? expert;

  @override
  State<ExpertAppointmentScreen> createState() =>
      _ExpertAppointmentScreenState();
}

class _ExpertAppointmentScreenState extends State<ExpertAppointmentScreen> {
  SessionType _sessionType = SessionType.video;
  late DateTime _focusedMonth;
  late DateTime _selectedDate;
  String _selectedTime = '10:00 AM';

  static const _timeSlots = [
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
  ];

  ExpertModel get _expert => widget.expert ?? expertsList.first;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _focusedMonth = DateTime(now.year, now.month);
    _selectedDate = DateTime(now.year, now.month, now.day);
  }

  void _changeMonth(int delta) {
    setState(() {
      _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month + delta);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasSafeArea: true,
      backgroundColor: context.colors.bg,
      statusBarColor: context.colors.white,
      appBar: CustomAppBar(
        title: const Text('Book Appointment'),
        centerTitle: true,
        backgroundColor: context.colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ExpertSummaryCard(expert: _expert),
            24.gapH,
            _SectionTitle('Select Session Type'),
            12.gapH,
            Row(
              children: [
                Expanded(
                  child: _SessionTypeCard(
                    isSelected: _sessionType == SessionType.video,
                    title: 'Video Session',
                    subtitle: 'Face to face via video call',
                    iconPath: Assets.icons.cam,
                    iconBackgroundColor: context.colors.primary.withValues(
                      alpha: 0.1,
                    ),
                    iconColor: context.colors.primary,
                    onTap: () {
                      setState(() => _sessionType = SessionType.video);
                    },
                  ),
                ),
                12.gapW,
                Expanded(
                  child: _SessionTypeCard(
                    isSelected: _sessionType == SessionType.audio,
                    title: 'Audio Session',
                    subtitle: 'Call with expert',
                    iconPath: Assets.icons.phone,
                    iconBackgroundColor: context.colors.success.withValues(
                      alpha: 0.12,
                    ),
                    iconColor: context.colors.successDarker,
                    onTap: () {
                      setState(() => _sessionType = SessionType.audio);
                    },
                  ),
                ),
              ],
            ),
            24.gapH,
            _SectionTitle('Select Date'),
            12.gapH,
            _BookingCalendar(
              focusedMonth: _focusedMonth,
              selectedDate: _selectedDate,
              onMonthChanged: _changeMonth,
              onDateSelected: (date) {
                setState(() => _selectedDate = date);
              },
            ),
            24.gapH,
            Row(
              children: [
                _SectionTitle('Select Time'),
                6.gapW,
                Text(
                  '(GMT +3)',
                  style: TextStyle(
                    fontSize: 13.spMin,
                    fontWeight: FontWeight.w400,
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
            12.gapH,
            _TimeSlotGrid(
              slots: _timeSlots,
              selectedTime: _selectedTime,
              onSelected: (time) {
                setState(() => _selectedTime = time);
              },
            ),
            24.gapH,
            _SectionTitle('Session Summary'),
            12.gapH,
            _SessionSummaryCard(
              expert: _expert,
              sessionType: _sessionType,
              selectedDate: _selectedDate,
              selectedTime: _selectedTime,
            ),
            120.gapH,
          ],
        ),
      ),
      bottomNavigationBar: _BottomBar(onConfirm: () {}),
    );
  }
}

class _ExpertSummaryCard extends StatelessWidget {
  const _ExpertSummaryCard({required this.expert});

  final ExpertModel expert;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.colors.grey250),
        boxShadow: [
          BoxShadow(
            color: context.colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              expert.imagePath,
              width: 56.w,
              height: 56.w,
              fit: BoxFit.cover,
            ),
          ),
          12.gapW,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expert.name,
                  style: TextStyle(
                    fontSize: 14.spMin,
                    fontWeight: FontWeight.w700,
                    color: context.colors.textPrimary,
                  ),
                ),
                2.gapH,
                Text(
                  expert.title,
                  style: TextStyle(
                    fontSize: 12.spMin,
                    fontWeight: FontWeight.w400,
                    color: context.colors.textSecondary,
                  ),
                ),
                6.gapH,
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: 14.r,
                      color: context.colors.yellow,
                    ),
                    4.gapW,
                    Text(
                      '${expert.rating} (${expert.reviewCount} reviews)',
                      style: TextStyle(
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w500,
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (expert.isOnline)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8.r,
                  height: 8.r,
                  decoration: BoxDecoration(
                    color: context.colors.success,
                    shape: BoxShape.circle,
                  ),
                ),
                4.gapW,
                Text(
                  'Online',
                  style: TextStyle(
                    fontSize: 12.spMin,
                    fontWeight: FontWeight.w600,
                    color: context.colors.successDarker,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

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

class _SessionTypeCard extends StatelessWidget {
  const _SessionTypeCard({
    required this.isSelected,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.onTap,
  });

  final bool isSelected;
  final String title;
  final String subtitle;
  final String iconPath;
  final Color iconBackgroundColor;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14.r),
        child: Ink(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: isSelected
                ? context.colors.primary.withValues(alpha: 0.04)
                : context.colors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: isSelected
                  ? context.colors.primary
                  : context.colors.grey250,
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40.r,
                    height: 40.r,
                    decoration: BoxDecoration(
                      color: iconBackgroundColor,
                      shape: BoxShape.circle,
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
                    subtitle,
                    style: TextStyle(
                      fontSize: 11.spMin,
                      fontWeight: FontWeight.w400,
                      color: context.colors.textSecondary,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
              if (isSelected)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Icon(
                    Icons.check_circle_rounded,
                    size: 18.r,
                    color: context.colors.primary,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BookingCalendar extends StatelessWidget {
  const _BookingCalendar({
    required this.focusedMonth,
    required this.selectedDate,
    required this.onMonthChanged,
    required this.onDateSelected,
  });

  final DateTime focusedMonth;
  final DateTime selectedDate;
  final ValueChanged<int> onMonthChanged;
  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    final monthLabel = DateFormat('MMMM yyyy').format(focusedMonth);
    final firstDayOfMonth = DateTime(focusedMonth.year, focusedMonth.month);
    final daysInMonth = DateTime(
      focusedMonth.year,
      focusedMonth.month + 1,
      0,
    ).day;
    final startWeekday = firstDayOfMonth.weekday % 7;
    final previousMonthDays = DateTime(
      focusedMonth.year,
      focusedMonth.month,
      0,
    ).day;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.colors.grey250),
        boxShadow: [
          BoxShadow(
            color: context.colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              _CalendarNavButton(
                iconPath: Assets.icons.chevronLeft,
                onTap: () => onMonthChanged(-1),
              ),
              Expanded(
                child: Text(
                  monthLabel,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.spMin,
                    fontWeight: FontWeight.w700,
                    color: context.colors.textPrimary,
                  ),
                ),
              ),
              _CalendarNavButton(
                iconPath: Assets.icons.chevronRight,
                onTap: () => onMonthChanged(1),
              ),
            ],
          ),
          16.gapH,
          Row(
            children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                .map(
                  (day) => Expanded(
                    child: Text(
                      day,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w500,
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          12.gapH,
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 42,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              final dayNumber = index - startWeekday + 1;
              final isCurrentMonth = dayNumber >= 1 && dayNumber <= daysInMonth;

              late DateTime date;
              late bool isOutsideMonth;

              if (isCurrentMonth) {
                date = DateTime(
                  focusedMonth.year,
                  focusedMonth.month,
                  dayNumber,
                );
                isOutsideMonth = false;
              } else if (dayNumber < 1) {
                final prevDay = previousMonthDays + dayNumber;
                date = DateTime(
                  focusedMonth.year,
                  focusedMonth.month - 1,
                  prevDay,
                );
                isOutsideMonth = true;
              } else {
                date = DateTime(
                  focusedMonth.year,
                  focusedMonth.month + 1,
                  dayNumber - daysInMonth,
                );
                isOutsideMonth = true;
              }

              final isSelected =
                  !isOutsideMonth &&
                  date.year == selectedDate.year &&
                  date.month == selectedDate.month &&
                  date.day == selectedDate.day;

              return _CalendarDayCell(
                day: date.day,
                isSelected: isSelected,
                isOutsideMonth: isOutsideMonth,
                onTap: isOutsideMonth ? null : () => onDateSelected(date),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CalendarNavButton extends StatelessWidget {
  const _CalendarNavButton({required this.iconPath, required this.onTap});

  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Padding(
          padding: EdgeInsets.all(6.w),
          child: SvgPicture.asset(
            iconPath,
            width: 18.r,
            height: 18.r,
            colorFilter: ColorFilter.mode(
              context.colors.textSecondary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

class _CalendarDayCell extends StatelessWidget {
  const _CalendarDayCell({
    required this.day,
    required this.isSelected,
    required this.isOutsideMonth,
    this.onTap,
  });

  final int day;
  final bool isSelected;
  final bool isOutsideMonth;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          alignment: Alignment.center,
          decoration: isSelected
              ? BoxDecoration(
                  color: context.colors.primary,
                  shape: BoxShape.circle,
                )
              : null,
          child: Text(
            '$day',
            style: TextStyle(
              fontSize: 13.spMin,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected
                  ? context.colors.white
                  : isOutsideMonth
                  ? context.colors.textTertiary
                  : context.colors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

class _TimeSlotGrid extends StatelessWidget {
  const _TimeSlotGrid({
    required this.slots,
    required this.selectedTime,
    required this.onSelected,
  });

  final List<String> slots;
  final String selectedTime;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: slots.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: 2.2,
      ),
      itemBuilder: (context, index) {
        final slot = slots[index];
        final isSelected = slot == selectedTime;

        return Material(
          color: context.colors.transparent,
          child: InkWell(
            onTap: () => onSelected(slot),
            borderRadius: BorderRadius.circular(10.r),
            child: Ink(
              decoration: BoxDecoration(
                color: isSelected
                    ? context.colors.primary
                    : context.colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: isSelected
                      ? context.colors.primary
                      : context.colors.grey250,
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  slot,
                  style: TextStyle(
                    fontSize: 11.spMin,
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? context.colors.white
                        : context.colors.textPrimary,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SessionSummaryCard extends StatelessWidget {
  const _SessionSummaryCard({
    required this.expert,
    required this.sessionType,
    required this.selectedDate,
    required this.selectedTime,
  });

  final ExpertModel expert;
  final SessionType sessionType;
  final DateTime selectedDate;
  final String selectedTime;

  @override
  Widget build(BuildContext context) {
    final sessionTypeLabel = sessionType == SessionType.video
        ? 'Video Session'
        : 'Audio Session';
    final formattedDate = DateFormat('EEE, d MMM yyyy').format(selectedDate);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          _SummaryRow(
            iconPath: Assets.icons.user,
            label: 'Expert',
            value: expert.name,
          ),
          12.gapH,
          _SummaryRow(
            iconPath: Assets.icons.cam,
            label: 'Type',
            value: sessionTypeLabel,
          ),
          12.gapH,
          _SummaryRow(
            iconPath: Assets.icons.calendar,
            label: 'Date',
            value: formattedDate,
          ),
          12.gapH,
          _SummaryRow(
            iconPath: Assets.icons.clock,
            label: 'Time',
            value: '$selectedTime (${expert.sessionDurationMinutes} min)',
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.iconPath,
    required this.label,
    required this.value,
  });

  final String iconPath;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          width: 18.r,
          height: 18.r,
          colorFilter: ColorFilter.mode(
            context.colors.textTertiary,
            BlendMode.srcIn,
          ),
        ),
        10.gapW,
        Text(
          label,
          style: TextStyle(
            fontSize: 13.spMin,
            fontWeight: FontWeight.w400,
            color: context.colors.textSecondary,
          ),
        ),
        const Spacer(),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 13.spMin,
              fontWeight: FontWeight.w600,
              color: context.colors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.onConfirm});

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 16.h),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              onPressed: onConfirm,
              backgroundColor: context.colors.primary,
              foregroundColor: context.colors.white,
              height: 52.h,
              width: double.infinity,
              borderRadius: BorderRadius.circular(14.r),
              text: 'Confirm Booking',
            ),
            10.gapH,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_outline_rounded,
                  size: 14.r,
                  color: context.colors.textTertiary,
                ),
                6.gapW,
                Text(
                  'Secure booking. You can reschedule later.',
                  style: TextStyle(
                    fontSize: 12.spMin,
                    fontWeight: FontWeight.w400,
                    color: context.colors.textTertiary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
