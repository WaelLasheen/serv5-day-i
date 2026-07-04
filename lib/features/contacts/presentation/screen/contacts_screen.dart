import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/features/contacts/presentation/manger/contacts_ui_cubit.dart';
import 'package:day_i/features/contacts/presentation/manger/contacts_ui_state.dart';
import 'package:day_i/features/contacts/presentation/widgets/contact_form.dart';
import 'package:day_i/features/contacts/presentation/widgets/contact_info_card.dart';
import 'package:day_i/features/contacts/presentation/widgets/contacts_tab_bar.dart';
import 'package:day_i/features/contacts/presentation/widgets/faq_list_widget.dart';
import 'package:day_i/features/contacts/presentation/widgets/map_placeholder.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).extension<AppTheme>()!;

    return BlocProvider(
      create: (context) => ContactsUiCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.surfaceColor,
        appBar: AppBar(
          backgroundColor: appTheme.surfaceColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            S.current.contactInfo,
            style: FontStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
              color: appTheme.textPrimary,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: appTheme.textPrimary),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16.h),
              const ContactsTabBar(),
              SizedBox(height: 24.h),
              BlocBuilder<ContactsUiCubit, ContactsUiState>(
                builder: (context, state) {
                  if (state.tabIndex == 0) {
                    // Contact Us Tab
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const ContactForm(),
                        SizedBox(height: 32.h),
                        const ContactInfoCard(),
                        SizedBox(height: 16.h),
                        const MapPlaceholder(),
                      ],
                    );
                  } else {
                    // FAQ Tab
                    return const FaqListWidget();
                  }
                },
              ),
              SizedBox(height: 120.h), // Extra space for FAB and bottom nav
            ],
          ),
        ),
      ),
    );
  }
}
