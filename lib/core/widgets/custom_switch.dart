import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const CustomSwitch({
    super.key,
    required this.value,
    this.onChanged,
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  @override
  void didUpdateWidget(covariant CustomSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Only override local state if the parent explicitly passes a new different value
    if (oldWidget.value != widget.value) {
      _currentValue = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Transform.scale(
      scale: 0.9,
      child: CupertinoSwitch(
        value: _currentValue,
        onChanged: (val) {
          setState(() {
            _currentValue = val;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(val);
          }
        },
        activeTrackColor: theme.primaryColor,
      ),
    );
  }
}
