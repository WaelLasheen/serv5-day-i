import 'package:day_i/core/localization/app_language.dart';
import 'package:day_i/core/localization/logic/locale_cubit.dart';
import 'package:day_i/core/localization/logic/locale_state.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.current.welcomeMessage,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            BlocBuilder<LocaleCubit, LocaleState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    final newLang = state.language == AppLanguage.en
                        ? AppLanguage.ar
                        : AppLanguage.en;
                    context.read<LocaleCubit>().changeLanguage(newLang);
                  },
                  child: Text(
                    state.language == AppLanguage.en
                        ? S.current.arabic
                        : S.current.english,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
