import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/core/widgets/custom_app_bar.dart';
import 'package:tarwati/core/widgets/custom_button.dart';
import 'package:tarwati/core/widgets/custom_scaffold.dart';
import 'package:tarwati/features/customer/presentation/pages/profile/models/user_profile_model.dart';
import 'package:tarwati/gen/assets.gen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, this.profile});

  final UserProfileModel? profile;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _cityController;
  late final TextEditingController _dateController;
  late final TextEditingController _countryController;
  late DateTime _dateOfBirth;
  late String _country;
  late String _imagePath;

  @override
  void initState() {
    super.initState();
    final profile = widget.profile ?? UserProfileModel.mock;
    _fullNameController = TextEditingController(text: profile.fullName);
    _emailController = TextEditingController(text: profile.email);
    _phoneController = TextEditingController(text: profile.phone);
    _cityController = TextEditingController(text: profile.city);
    _dateOfBirth = profile.dateOfBirth;
    _country = profile.country;
    _imagePath = profile.imagePath;
    _dateController = TextEditingController(
      text: DateFormat('d MMM yyyy').format(_dateOfBirth),
    );
    _countryController = TextEditingController(text: _country);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    _dateController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  Future<void> _pickDateOfBirth() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dateOfBirth,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _dateOfBirth = picked;
        _dateController.text = DateFormat('d MMM yyyy').format(picked);
      });
    }
  }

  Future<void> _pickCountry() async {
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
            children: profileCountries
                .map(
                  (country) => ListTile(
                    title: Text(country),
                    trailing: country == _country
                        ? Icon(
                            Icons.check_rounded,
                            color: context.colors.primary,
                          )
                        : null,
                    onTap: () => Navigator.pop(context, country),
                  ),
                )
                .toList(),
          ),
        );
      },
    );

    if (selected != null) {
      setState(() {
        _country = selected;
        _countryController.text = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final profile = widget.profile ?? UserProfileModel.mock;

    return CustomScaffold(
      hasSafeArea: true,
      backgroundColor: context.colors.white,
      statusBarColor: context.colors.white,
      appBar: CustomAppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
        backgroundColor: context.colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 24.h),
              child: Column(
                children: [
                  _ProfileAvatarSection(
                    imagePath: _imagePath,
                    onEditPhoto: () {},
                  ),
                  28.gapH,
                  _ProfileTextField(
                    label: 'Full Name',
                    controller: _fullNameController,
                  ),
                  18.gapH,
                  _ProfileTextField(
                    label: 'Email Address',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  18.gapH,
                  _PhoneNumberField(
                    label: 'Phone Number',
                    controller: _phoneController,
                    countryFlag: profile.countryFlag,
                    countryCode: profile.countryCode,
                  ),
                  18.gapH,
                  _ProfileTextField(
                    label: 'Date of Birth',
                    controller: _dateController,
                    readOnly: true,
                    onTap: _pickDateOfBirth,
                    suffixIcon: SvgPicture.asset(
                      Assets.icons.calendar,
                      width: 20.r,
                      height: 20.r,
                      colorFilter: ColorFilter.mode(
                        context.colors.textTertiary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  18.gapH,
                  _ProfileTextField(
                    label: 'Country',
                    controller: _countryController,
                    readOnly: true,
                    onTap: _pickCountry,
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 22.r,
                      color: context.colors.textTertiary,
                    ),
                  ),
                  18.gapH,
                  _ProfileTextField(label: 'City', controller: _cityController),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 24.h),
            child: CustomButton(
              onPressed: () => context.safePop(),
              backgroundColor: context.colors.primary,
              foregroundColor: context.colors.white,
              height: 52.h,
              width: double.infinity,
              borderRadius: BorderRadius.circular(14.r),
              text: 'Save Changes',
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileAvatarSection extends StatelessWidget {
  const _ProfileAvatarSection({
    required this.imagePath,
    required this.onEditPhoto,
  });

  final String imagePath;
  final VoidCallback onEditPhoto;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 108.r,
      height: 108.r,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipOval(
            child: Image.asset(
              imagePath,
              width: 108.r,
              height: 108.r,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Material(
              color: context.colors.transparent,
              child: InkWell(
                onTap: onEditPhoto,
                customBorder: const CircleBorder(),
                child: Ink(
                  width: 32.r,
                  height: 32.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.colors.primary,
                    border: Border.all(color: context.colors.white, width: 2),
                  ),
                  child: Icon(
                    Icons.camera_alt_rounded,
                    size: 16.r,
                    color: context.colors.white,
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

class _ProfileTextField extends StatelessWidget {
  const _ProfileTextField({
    required this.label,
    required this.controller,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
  });

  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.spMin,
            fontWeight: FontWeight.w500,
            color: context.colors.textSecondary,
          ),
        ),
        8.gapH,
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          readOnly: readOnly,
          onTap: onTap,
          style: TextStyle(
            fontSize: 14.spMin,
            fontWeight: FontWeight.w500,
            color: context.colors.textPrimary,
          ),
          decoration: InputDecoration(
            suffixIcon: suffixIcon == null
                ? null
                : Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: suffixIcon,
                  ),
            suffixIconConstraints: BoxConstraints(
              minWidth: 32.w,
              minHeight: 32.h,
            ),
            filled: true,
            fillColor: context.colors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: context.colors.grey250),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: context.colors.primary.withValues(alpha: 0.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PhoneNumberField extends StatelessWidget {
  const _PhoneNumberField({
    required this.label,
    required this.controller,
    required this.countryFlag,
    required this.countryCode,
  });

  final String label;
  final TextEditingController controller;
  final String countryFlag;
  final String countryCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.spMin,
            fontWeight: FontWeight.w500,
            color: context.colors.textSecondary,
          ),
        ),
        8.gapH,
        Container(
          decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: context.colors.grey250),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(countryFlag, style: TextStyle(fontSize: 18.spMin)),
                    4.gapW,
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 18.r,
                      color: context.colors.textTertiary,
                    ),
                  ],
                ),
              ),
              Container(width: 1, height: 28.h, color: context.colors.grey250),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                    fontSize: 14.spMin,
                    fontWeight: FontWeight.w500,
                    color: context.colors.textPrimary,
                  ),
                  decoration: InputDecoration(
                    prefixText: '$countryCode ',
                    prefixStyle: TextStyle(
                      fontSize: 14.spMin,
                      fontWeight: FontWeight.w500,
                      color: context.colors.textPrimary,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
