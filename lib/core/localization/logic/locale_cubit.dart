import 'package:day_i/core/localization/app_language_enum.dart';
import 'package:day_i/core/localization/logic/locale_state.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class LocaleCubit extends HydratedCubit<LocaleState> {
  LocaleCubit()
    : super(
        const LocaleState(locale: Locale('ar'), language: AppLanguageEnum.ar),
      );
  void changeLanguage(AppLanguageEnum language) {
    if (language == state.language) return;
    emit(LocaleState(locale: Locale(language.name), language: language));
  }

  @override
  LocaleState? fromJson(Map<String, dynamic> json) {
    final languageName = json['language'] as String?;
    if (languageName == null) return null;

    final language = AppLanguageEnum.values.firstWhere(
      (e) => e.name == languageName,
      orElse: () => AppLanguageEnum.en,
    );

    return LocaleState(locale: Locale(language.name), language: language);
  }

  @override
  Map<String, dynamic>? toJson(LocaleState state) {
    return {'language': state.language.name};
  }
}
