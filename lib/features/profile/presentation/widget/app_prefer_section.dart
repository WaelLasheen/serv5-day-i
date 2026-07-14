import 'package:day_i/generated/l10n.dart';
import 'package:day_i/features/profile/presentation/widget/custom_info_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_i/core/localization/logic/locale_cubit.dart';
import 'package:day_i/core/localization/logic/locale_state.dart';
import 'package:day_i/core/localization/app_language_enum.dart';
import 'package:day_i/core/widgets/custom_switch.dart';

class AppPreferSection extends StatelessWidget {
  const AppPreferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, localeState) {
        final isEnglish = localeState.language == AppLanguageEnum.en;
        final langText = isEnglish ? S.of(context).english : S.of(context).arabic;

        return CustomInfoSection(
          sectionTitle: S.of(context).appPreferences,
          infoData: [
            // Row: Notifications
            InfoModel(
              title: S.of(context).notifications,
              icon: Icons.notifications_none_outlined,
              trailing: CustomSwitch(value: true, onChanged: (val) {}),
            ),
            // Row: Dark Mode Option
            InfoModel(
              title: S.of(context).darkMode,
              icon: Icons.dark_mode_outlined,
              trailing: CustomSwitch(value: true, onChanged: (val) {}),
            ),
            // Row: Language Metadata Selection
            InfoModel(
              title: S.of(context).language,
              description: langText,
              icon: Icons.language_rounded,
              trailing: CustomSwitch(
                value: isEnglish,
                onChanged: (val) {
                  final newLang = val ? AppLanguageEnum.en : AppLanguageEnum.ar;
                  context.read<LocaleCubit>().changeLanguage(newLang);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
