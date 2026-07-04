import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/features/contacts/presentation/manger/contacts_ui_cubit.dart';
import 'package:day_i/features/contacts/presentation/manger/contacts_ui_state.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactsTabBar extends StatelessWidget {
  const ContactsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).extension<AppTheme>()!;

    return BlocBuilder<ContactsUiCubit, ContactsUiState>(
      builder: (context, state) {
        return Container(
          height: 56.h,
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: appTheme.surfaceColor,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: appTheme.boarderPrimary),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => context.read<ContactsUiCubit>().changeTab(0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: state.tabIndex == 0
                          ? appTheme.primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      S.current.contactUs,
                      style: FontStyles.bodyMedium.copyWith(
                        fontWeight: state.tabIndex == 0
                            ? FontWeight.w500
                            : FontWeight.w400,
                        color: state.tabIndex == 0
                            ? appTheme.surfaceColor
                            : appTheme.grey800,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => context.read<ContactsUiCubit>().changeTab(1),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: state.tabIndex == 1
                          ? appTheme.primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      S.current.faqs,
                      style: FontStyles.bodyMedium.copyWith(
                        fontWeight: state.tabIndex == 1
                            ? FontWeight.w500
                            : FontWeight.w400,
                        color: state.tabIndex == 1
                            ? appTheme.surfaceColor
                            : appTheme.grey800,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
