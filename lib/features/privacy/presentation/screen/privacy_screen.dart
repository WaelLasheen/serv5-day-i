import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/features/privacy/presentation/manager/privacy_cubit.dart';
import 'package:day_i/features/privacy/presentation/manager/privacy_state.dart';
import 'package:day_i/features/privacy/presentation/widgets/privacy_info_box.dart';
import 'package:day_i/features/privacy/presentation/widgets/privacy_section.dart';
import 'package:day_i/features/privacy/presentation/widgets/privacy_toggle_row.dart';
import 'package:day_i/generated/l10n.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PrivacyCubit>(),
      child: const _PrivacyView(),
    );
  }
}

class _PrivacyView extends StatelessWidget {
  const _PrivacyView();

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.current.privacy,
          style: FontStyles.h3.copyWith(color: theme.textPrimary),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_forward,
            color: theme.primaryColor,
            textDirection: TextDirection.ltr,
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(color: theme.boarderPrimary, height: 1.h),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Builder(
              builder: (context) {
                final cubit = context.read<PrivacyCubit>();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    PrivacySection(
                      title: S.current.dataUsage,
                      child: Column(
                        children: [
                          BlocSelector<PrivacyCubit, PrivacyState, bool>(
                            selector: (state) => state.shareData,
                            builder: (context, value) {
                              return PrivacyToggleRow(
                                title: S.current.shareDataTeamOnly,
                                value: value,
                                onChanged: cubit.toggleShareData,
                              );
                            },
                          ),
                          BlocSelector<PrivacyCubit, PrivacyState, bool>(
                            selector: (state) => state.improveService,
                            builder: (context, value) {
                              return PrivacyToggleRow(
                                title: S.current.allowDataImproveService,
                                value: value,
                                onChanged: cubit.toggleImproveService,
                                showDivider: false,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),

                    PrivacySection(
                      title: S.current.visibilityControl,
                      child: Column(
                        children: [
                          BlocSelector<PrivacyCubit, PrivacyState, bool>(
                            selector: (state) => state.visibilityManager,
                            builder: (context, value) {
                              return PrivacyToggleRow(
                                title: S.current.managerOnly,
                                value: value,
                                onChanged: cubit.toggleVisibilityManager,
                              );
                            },
                          ),
                          BlocSelector<PrivacyCubit, PrivacyState, bool>(
                            selector: (state) => state.visibilityTeam,
                            builder: (context, value) {
                              return PrivacyToggleRow(
                                title: S.current.assignedTeam,
                                value: value,
                                onChanged: cubit.toggleVisibilityTeam,
                                showDivider: false,
                                infoText: S.current.unauthorizedNotVisible,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),

                    PrivacySection(
                      title: S.current.securityAlerts,
                      child: Column(
                        children: [
                          BlocSelector<PrivacyCubit, PrivacyState, bool>(
                            selector: (state) => state.alertNewLogin,
                            builder: (context, value) {
                              return PrivacyToggleRow(
                                title: S.current.alertNewLogin,
                                value: value,
                                onChanged: cubit.toggleAlertNewLogin,
                              );
                            },
                          ),
                          BlocSelector<PrivacyCubit, PrivacyState, bool>(
                            selector: (state) => state.alertStatusChange,
                            builder: (context, value) {
                              return PrivacyToggleRow(
                                title: S.current.alertStatusChange,
                                value: value,
                                onChanged: cubit.toggleAlertStatusChange,
                                showDivider: false,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),

                    PrivacySection(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                      title: S.current.accountControl,
                      child: Column(
                        children: [
                          AppButton(
                            text: S.current.deactivateAccount,
                            onPressed: () {},
                            isPrimary: false,
                          ),
                          SizedBox(height: 16.h),
                          AppButton(
                            text: S.current.deleteAccount,
                            onPressed: () {},
                            isPrimary: true,
                            backgroundColor: theme.errorColor,
                          ),
                          SizedBox(height: 16.h),
                          PrivacyInfoBox(
                            text: S.current.deleteAccountWarning,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 40.h),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
