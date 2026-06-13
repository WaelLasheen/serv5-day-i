import 'package:flutter/material.dart';
import 'package:day_i/l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get getLocalization => AppLocalizations.of(this)!;
}
