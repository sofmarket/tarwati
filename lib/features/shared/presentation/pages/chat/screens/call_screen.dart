import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tarwati/core/routing/routes.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/features/shared/presentation/pages/chat/models/call_session_model.dart';
import 'package:tarwati/gen/assets.gen.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({
    super.key,
    this.session,
  });

  final CallSessionModel? session;

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  bool _isMuted = false;
  bool _isCameraOff = false;
  bool _isSpeakerOn = true;
  bool _isDetailsExpanded = true;
  Duration _elapsed = Duration.zero;
  Timer? _timer;

  CallSessionModel get _session => widget.session ?? CallSessionModel.mock;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _elapsed += const Duration(seconds: 1));
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formattedDuration {
    final minutes = _elapsed.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = _elapsed.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final overlayStyle = SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    _session.expertImagePath,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: 160.h,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.65),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 120.h,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.55),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  SafeArea(
                    bottom: false,
                    child: _CallTopBar(
                      expertName: _session.expertName,
                      duration: _formattedDuration,
                      onMinimize: () => context.safePop(),
                      onEndCall: () => context.safePop(),
                    ),
                  ),
                  Positioned(
                    right: 20.w,
                    bottom: 20.h,
                    child: _SelfViewPreview(
                      imagePath: _session.selfImagePath,
                      isCameraOff: _isCameraOff,
                    ),
                  ),
                ],
              ),
            ),
            _CallControlsBar(
              isMuted: _isMuted,
              isCameraOff: _isCameraOff,
              isSpeakerOn: _isSpeakerOn,
              onToggleMute: () => setState(() => _isMuted = !_isMuted),
              onToggleCamera: () =>
                  setState(() => _isCameraOff = !_isCameraOff),
              onToggleSpeaker: () =>
                  setState(() => _isSpeakerOn = !_isSpeakerOn),
              onChat: () {
                context.pushNamed(
                  Routes.chat.name,
                  extra: _session,
                );
              },
              onMore: () {},
            ),
            _SessionDetailsPanel(
              session: _session,
              isExpanded: _isDetailsExpanded,
              onToggle: () {
                setState(() => _isDetailsExpanded = !_isDetailsExpanded);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CallTopBar extends StatelessWidget {
  const _CallTopBar({
    required this.expertName,
    required this.duration,
    required this.onMinimize,
    required this.onEndCall,
  });

  final String expertName;
  final String duration;
  final VoidCallback onMinimize;
  final VoidCallback onEndCall;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.w, 8.h, 16.w, 0),
      child: Row(
        children: [
          IconButton(
            onPressed: onMinimize,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 28.r,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  expertName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.spMin,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                2.gapH,
                Text(
                  duration,
                  style: TextStyle(
                    fontSize: 14.spMin,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onEndCall,
              borderRadius: BorderRadius.circular(24.r),
              child: Ink(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFE53935),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Transform.rotate(
                      angle: 2.2,
                      child: Icon(
                        Icons.call_end_rounded,
                        size: 16.r,
                        color: Colors.white,
                      ),
                    ),
                    6.gapW,
                    Text(
                      'End',
                      style: TextStyle(
                        fontSize: 14.spMin,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SelfViewPreview extends StatelessWidget {
  const _SelfViewPreview({
    required this.imagePath,
    required this.isCameraOff,
  });

  final String imagePath;
  final bool isCameraOff;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 96.w,
        height: 128.h,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A3A),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: isCameraOff
            ? Center(
                child: SvgPicture.asset(
                  Assets.icons.camDisabled,
                  width: 28.r,
                  height: 28.r,
                  colorFilter: ColorFilter.mode(
                    Colors.white.withValues(alpha: 0.6),
                    BlendMode.srcIn,
                  ),
                ),
              )
            : Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

class _CallControlsBar extends StatelessWidget {
  const _CallControlsBar({
    required this.isMuted,
    required this.isCameraOff,
    required this.isSpeakerOn,
    required this.onToggleMute,
    required this.onToggleCamera,
    required this.onToggleSpeaker,
    required this.onChat,
    required this.onMore,
  });

  final bool isMuted;
  final bool isCameraOff;
  final bool isSpeakerOn;
  final VoidCallback onToggleMute;
  final VoidCallback onToggleCamera;
  final VoidCallback onToggleSpeaker;
  final VoidCallback onChat;
  final VoidCallback onMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(12.w, 16.h, 12.w, 20.h),
      color: const Color(0xFF12121A),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _CallControlButton(
              label: 'Mute',
              iconPath: isMuted
                  ? Assets.icons.microphoneDisabled
                  : Assets.icons.microphone,
              isActive: isMuted,
              onTap: onToggleMute,
            ),
            _CallControlButton(
              label: 'Camera',
              iconPath: isCameraOff ? Assets.icons.camDisabled : Assets.icons.cam,
              isActive: isCameraOff,
              onTap: onToggleCamera,
            ),
            _CallControlButton(
              label: 'Speaker',
              iconPath: isSpeakerOn
                  ? Assets.icons.speaker
                  : Assets.icons.speakerDisabled,
              isActive: !isSpeakerOn,
              onTap: onToggleSpeaker,
            ),
            _CallControlButton(
              label: 'Chat',
              iconPath: Assets.icons.messageCircleDots,
              onTap: onChat,
            ),
            _CallControlButton(
              label: 'More',
              iconPath: Assets.icons.menuHorizontal,
              onTap: onMore,
            ),
          ],
        ),
      ),
    );
  }
}

class _CallControlButton extends StatelessWidget {
  const _CallControlButton({
    required this.label,
    required this.iconPath,
    required this.onTap,
    this.isActive = false,
  });

  final String label;
  final String iconPath;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(32.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 52.r,
              height: 52.r,
              decoration: BoxDecoration(
                color: isActive
                    ? Colors.white.withValues(alpha: 0.25)
                    : Colors.white.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                iconPath,
                width: 22.r,
                height: 22.r,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
            8.gapH,
            Text(
              label,
              style: TextStyle(
                fontSize: 12.spMin,
                fontWeight: FontWeight.w500,
                color: Colors.white.withValues(alpha: 0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SessionDetailsPanel extends StatelessWidget {
  const _SessionDetailsPanel({
    required this.session,
    required this.isExpanded,
    required this.onToggle,
  });

  final CallSessionModel session;
  final bool isExpanded;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 24.h),
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A24),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onToggle,
                borderRadius: BorderRadius.circular(8.r),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: Row(
                    children: [
                      Text(
                        'Session Details',
                        style: TextStyle(
                          fontSize: 16.spMin,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_down_rounded
                            : Icons.keyboard_arrow_up_rounded,
                        size: 22.r,
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (isExpanded) ...[
              16.gapH,
              _SessionDetailRow(
                iconPath: Assets.icons.cam,
                label: 'Type',
                value: session.sessionType,
              ),
              12.gapH,
              _SessionDetailRow(
                iconPath: Assets.icons.calendar,
                label: 'Date',
                value: session.sessionDate,
              ),
              12.gapH,
              _SessionDetailRow(
                iconPath: Assets.icons.clock,
                label: 'Time',
                value: session.sessionTime,
              ),
              12.gapH,
              _SessionDetailRow(
                iconPath: Assets.icons.user,
                label: 'Expert',
                value: session.expertName,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SessionDetailRow extends StatelessWidget {
  const _SessionDetailRow({
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
        Container(
          width: 36.r,
          height: 36.r,
          decoration: BoxDecoration(
            color: context.colors.primary.withValues(alpha: 0.18),
            borderRadius: BorderRadius.circular(10.r),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            iconPath,
            width: 18.r,
            height: 18.r,
            colorFilter: ColorFilter.mode(
              context.colors.primaryLight,
              BlendMode.srcIn,
            ),
          ),
        ),
        12.gapW,
        Text(
          label,
          style: TextStyle(
            fontSize: 13.spMin,
            fontWeight: FontWeight.w400,
            color: Colors.white.withValues(alpha: 0.55),
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
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
