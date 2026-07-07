import 'package:day_i/core/localization/app_language_enum.dart';
import 'package:day_i/core/localization/logic/locale_cubit.dart';
import 'package:day_i/core/localization/logic/locale_state.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageSwitcher extends StatelessWidget {
  final Color? color;
  const LanguageSwitcher({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        final currentLang = state.language;

        return PopupMenuButton<AppLanguageEnum>(
          initialValue: currentLang,
          tooltip: S.current.changeLanguage,
          onSelected: (AppLanguageEnum language) {
            context.read<LocaleCubit>().changeLanguage(language);
          },
          offset: Offset(0, 32.h),
          borderRadius: BorderRadius.circular(16.r),
          color: appTheme.surfaceColor,
          itemBuilder: (BuildContext context) => AppLanguageEnum.values.map((
            lang,
          ) {
            return PopupMenuItem<AppLanguageEnum>(
              value: lang,
              child: Row(
                spacing: 4.w,
                children: [
                  Text(lang.languageName, style: context.textTheme.bodyMedium),
                  if (currentLang == lang)
                    Icon(
                      Icons.check,
                      size: 18.r,
                      color: Theme.of(context).primaryColor,
                    ),
                ],
              ),
            );
          }).toList(),
          child: SizedBox(
            width: 50.w,
            height: 24.h,
            child: Row(
              spacing: 8.w,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.language,
                  size: 24.r,
                  color: color ?? appTheme.surfaceColor,
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 18.r,
                  color: color ?? appTheme.surfaceColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
