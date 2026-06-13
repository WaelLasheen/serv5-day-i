import 'package:day_i/core/localization/app_language.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LocaleState extends Equatable {
  final Locale locale;
  final AppLanguage language;

  const LocaleState({
    required this.locale,
    required this.language,
  });

  @override
  List<Object> get props => [locale, language];
}
