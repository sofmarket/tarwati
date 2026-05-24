import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tarwati/core/routing/routes.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/core/widgets/custom_scaffold.dart';
import 'package:tarwati/features/customer/presentation/pages/home/widgets/customer_bottom_nav_widget.dart';
import 'package:tarwati/features/shared/presentation/pages/chat/models/call_session_model.dart';
import 'package:tarwati/features/shared/presentation/pages/chat/models/chat_message_model.dart';
import 'package:tarwati/gen/assets.gen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    this.expertName,
    this.expertImagePath,
    this.isOnline = true,
  });

  final String? expertName;
  final String? expertImagePath;
  final bool isOnline;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();

  String get _expertName =>
      widget.expertName ?? CallSessionModel.mock.expertName;

  String get _expertImagePath =>
      widget.expertImagePath ?? CallSessionModel.mock.expertImagePath;

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasSafeArea: true,
      backgroundColor: context.colors.white,
      statusBarColor: context.colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(124.h),
        child: _ChatAppHeader(
          expertName: _expertName,
          expertImagePath: _expertImagePath,
          isOnline: widget.isOnline,
          onAudioCall: () {
            context.pushNamed(
              Routes.call.name,
              extra: CallSessionModel(
                expertName: _expertName,
                expertImagePath: _expertImagePath,
                sessionType: 'Audio Session',
              ),
            );
          },
          onVideoCall: () {
            context.pushNamed(
              Routes.call.name,
              extra: CallSessionModel(
                expertName: _expertName,
                expertImagePath: _expertImagePath,
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const CustomerBottomNavWidget(currentIndex: 3),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                const _ChatBackgroundPattern(),
                ListView(
                  controller: _scrollController,
                  padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
                  children: [
                    const _DateSeparator(label: 'Today'),
                    16.gapH,
                    ...chatMessages.map(
                      (message) => Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: _ChatMessageBubble(message: message),
                      ),
                    ),
                    const _TypingIndicator(),
                  ],
                ),
              ],
            ),
          ),
          _ChatInputBar(
            controller: _messageController,
            onSend: () {
              if (_messageController.text.trim().isEmpty) return;
              _messageController.clear();
            },
          ),
        ],
      ),
    );
  }
}

class _ChatAppHeader extends StatelessWidget {
  const _ChatAppHeader({
    required this.expertName,
    required this.expertImagePath,
    required this.isOnline,
    required this.onAudioCall,
    required this.onVideoCall,
  });

  final String expertName;
  final String expertImagePath;
  final bool isOnline;
  final VoidCallback onAudioCall;
  final VoidCallback onVideoCall;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.white,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(
              height: 56.h,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => context.safePop(),
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      size: 22.r,
                      color: context.colors.textPrimary,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Messages',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17.spMin,
                        fontWeight: FontWeight.w700,
                        color: context.colors.textPrimary,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search_rounded,
                      size: 22.r,
                      color: context.colors.textPrimary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Assets.icons.menuVertical,
                      width: 20.r,
                      height: 20.r,
                      colorFilter: ColorFilter.mode(
                        context.colors.textPrimary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  4.gapW,
                ],
              ),
            ),
            Divider(height: 1, color: context.colors.grey250),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 12.h),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      expertImagePath,
                      width: 44.r,
                      height: 44.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                  12.gapW,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          expertName,
                          style: TextStyle(
                            fontSize: 15.spMin,
                            fontWeight: FontWeight.w700,
                            color: context.colors.textPrimary,
                          ),
                        ),
                        if (isOnline) ...[
                          2.gapH,
                          Row(
                            children: [
                              Container(
                                width: 8.r,
                                height: 8.r,
                                decoration: BoxDecoration(
                                  color: context.colors.success,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              6.gapW,
                              Text(
                                'Online',
                                style: TextStyle(
                                  fontSize: 12.spMin,
                                  fontWeight: FontWeight.w500,
                                  color: context.colors.successDarker,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  _CallActionButton(
                    iconPath: Assets.icons.phone,
                    onTap: onAudioCall,
                  ),
                  8.gapW,
                  _CallActionButton(
                    iconPath: Assets.icons.cam,
                    onTap: onVideoCall,
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: context.colors.grey250),
          ],
        ),
      ),
    );
  }
}

class _CallActionButton extends StatelessWidget {
  const _CallActionButton({
    required this.iconPath,
    required this.onTap,
  });

  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.r),
        child: Ink(
          width: 40.r,
          height: 40.r,
          decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: context.colors.grey250),
          ),
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              width: 20.r,
              height: 20.r,
              colorFilter: ColorFilter.mode(
                context.colors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChatBackgroundPattern extends StatelessWidget {
  const _ChatBackgroundPattern();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF3F3F6),
      child: CustomPaint(
        painter: _ChatPatternPainter(
          color: context.colors.textTertiary.withValues(alpha: 0.08),
        ),
        size: Size.infinite,
      ),
    );
  }
}

class _ChatPatternPainter extends CustomPainter {
  _ChatPatternPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    const spacing = 72.0;
    for (var x = 0.0; x < size.width; x += spacing) {
      for (var y = 0.0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x + 18, y + 18), 6, paint);
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(x + 40, y + 10, 18, 14),
            const Radius.circular(4),
          ),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DateSeparator extends StatelessWidget {
  const _DateSeparator({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: context.colors.grey250,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.spMin,
            fontWeight: FontWeight.w500,
            color: context.colors.textSecondary,
          ),
        ),
      ),
    );
  }
}

class _ChatMessageBubble extends StatelessWidget {
  const _ChatMessageBubble({required this.message});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final isUser = message.sender == ChatMessageSender.user;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 280.w),
        child: Container(
          padding: EdgeInsets.fromLTRB(14.w, 10.h, 14.w, 8.h),
          decoration: BoxDecoration(
            color: isUser ? context.colors.primary : context.colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
              bottomLeft: Radius.circular(isUser ? 16.r : 4.r),
              bottomRight: Radius.circular(isUser ? 4.r : 16.r),
            ),
            boxShadow: isUser
                ? null
                : [
                    BoxShadow(
                      color: context.colors.black.withValues(alpha: 0.04),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  message.text,
                  style: TextStyle(
                    fontSize: 14.spMin,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    color: isUser
                        ? context.colors.white
                        : context.colors.textPrimary,
                  ),
                ),
              ),
              4.gapH,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message.time,
                    style: TextStyle(
                      fontSize: 11.spMin,
                      fontWeight: FontWeight.w400,
                      color: isUser
                          ? context.colors.white.withValues(alpha: 0.75)
                          : context.colors.textTertiary,
                    ),
                  ),
                  if (isUser && message.isRead) ...[
                    4.gapW,
                    Icon(
                      Icons.done_all_rounded,
                      size: 14.r,
                      color: const Color(0xFF8ECAFF),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TypingIndicator extends StatelessWidget {
  const _TypingIndicator();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
            bottomLeft: Radius.circular(4.r),
          ),
          boxShadow: [
            BoxShadow(
              color: context.colors.black.withValues(alpha: 0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (index) {
            return Container(
              width: 7.r,
              height: 7.r,
              margin: EdgeInsets.only(right: index == 2 ? 0 : 5.w),
              decoration: BoxDecoration(
                color: context.colors.textTertiary,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _ChatInputBar extends StatelessWidget {
  const _ChatInputBar({
    required this.controller,
    required this.onSend,
  });

  final TextEditingController controller;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 10.h),
      decoration: BoxDecoration(
        color: context.colors.white,
        border: Border(
          top: BorderSide(color: context.colors.grey250),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.attach_file_rounded,
                size: 22.r,
                color: context.colors.textTertiary,
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  hintStyle: TextStyle(
                    fontSize: 14.spMin,
                    fontWeight: FontWeight.w400,
                    color: context.colors.textTertiary,
                  ),
                  filled: true,
                  fillColor: context.colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.r),
                    borderSide: BorderSide(color: context.colors.grey250),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.r),
                    borderSide: BorderSide(
                      color: context.colors.primary.withValues(alpha: 0.4),
                    ),
                  ),
                ),
              ),
            ),
            8.gapW,
            Material(
              color: context.colors.transparent,
              child: InkWell(
                onTap: onSend,
                customBorder: const CircleBorder(),
                child: Ink(
                  width: 44.r,
                  height: 44.r,
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.icons.send,
                      width: 20.r,
                      height: 20.r,
                      colorFilter: ColorFilter.mode(
                        context.colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
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
