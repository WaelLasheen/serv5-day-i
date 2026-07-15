import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';

class FloatingBotButton extends StatefulWidget {
  final VoidCallback onTap;

  const FloatingBotButton({super.key, required this.onTap});

  @override
  State<FloatingBotButton> createState() => _FloatingBotButtonState();
}

class _FloatingBotButtonState extends State<FloatingBotButton> {
  bool _isExpanded = false;
  Timer? _autoHideTimer;

  void _handleTap() {
    if (!_isExpanded) {
      setState(() {
        _isExpanded = true;
      });
      _startAutoHideTimer();
    } else {
      _autoHideTimer?.cancel();
      setState(() {
        _isExpanded = false;
      });
      widget.onTap();
    }
  }

  void _startAutoHideTimer() {
    _autoHideTimer?.cancel();
    _autoHideTimer = Timer(const Duration(seconds: 4), () {
      if (mounted && _isExpanded) {
        setState(() {
          _isExpanded = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _autoHideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
      bottom: 120.h,
      left: isRtl ? (_isExpanded ? 16.w : -38.w) : null,
      right: !isRtl ? (_isExpanded ? 16.w : -38.w) : null,
      child: TapRegion(
        onTapOutside: (_) {
          if (_isExpanded) {
            _autoHideTimer?.cancel();
            setState(() {
              _isExpanded = false;
            });
          }
        },
        child: GestureDetector(
          onTap: _handleTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 320),
            curve: Curves.easeOutCubic,
            width: 56.r,
            height: 56.r,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(28.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.18),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 320),
              curve: Curves.easeOutCubic,
              alignment: _isExpanded
                  ? Alignment.center
                  : (isRtl ? Alignment.centerRight : Alignment.centerLeft),
              child: Padding(
                padding: EdgeInsets.only(
                  right: (_isExpanded || !isRtl) ? 0 : 6.w,
                  left: (_isExpanded || isRtl) ? 0 : 6.w,
                ),
                child: Icon(
                  Icons.smart_toy_outlined,
                  color: Colors.white,
                  size: 28.r,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
