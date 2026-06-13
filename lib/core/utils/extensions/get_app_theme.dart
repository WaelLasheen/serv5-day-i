import 'package:day_i/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

extension GetAppTheme on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
  TextTheme get textTheme => Theme.of(this).textTheme;
}
