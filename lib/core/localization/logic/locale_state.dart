import 'package:day_i/core/localization/app_language_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LocaleState extends Equatable {
  final Locale locale;
  final AppLanguageEnum language;

  const LocaleState({required this.locale, required this.language});

  @override
  List<Object> get props => [locale, language];
}
