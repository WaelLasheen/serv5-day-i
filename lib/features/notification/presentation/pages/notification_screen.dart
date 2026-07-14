import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/features/notification/presentation/widgets/notification_card.dart';
import 'package:day_i/generated/l10n.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_i/features/notification/presentation/controller/notification_cubit/notification_cubit.dart';
import 'package:day_i/features/notification/presentation/controller/notification_cubit/notification_state.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).extension<AppTheme>()!;
    final textTheme = context.textTheme;

    return Scaffold(
      backgroundColor: appTheme.surfaceColor, // From Figma: background: #FFFFFF
      appBar: AppBar(
        backgroundColor: appTheme.surfaceColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).notifications,
          style: textTheme.titleLarge?.copyWith(color: appTheme.textPrimary),
        ),
        leading: IconButton(
          icon: Icon(
            Directionality.of(context) == TextDirection.rtl
                ? Icons.arrow_forward_rounded
                : Icons.arrow_back_rounded,
            color: appTheme.primaryColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(color: appTheme.boarderPrimary, height: 1.h),
        ),
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state is NotificationLoading) {
            return Center(
              child: CircularProgressIndicator(color: appTheme.primaryColor),
            );
          } else if (state is NotificationError) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Text(
                  state.message,
                  style: textTheme.bodyLarge?.copyWith(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else if (state is NotificationLoaded || state is UnreadNotificationsLoaded) {
            final notifications = state is NotificationLoaded
                ? state.notifications
                : (state as UnreadNotificationsLoaded).notifications;
            if (notifications.isEmpty) {
              return Center(
                child: Text(
                  S.of(context).noNotificationsCurrently,
                  style: textTheme.bodyMedium?.copyWith(
                    color: appTheme.textPrimary,
                  ),
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: () =>
                  context.read<NotificationCubit>().fetchNotifications(),
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                itemCount: notifications.length,
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return NotificationCard(
                    title: notification.title,
                    subtitle: notification.subtitle,
                  );
                },
              ),
            );
          }

          // Initial State — show localized placeholders until fetch completes
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            children: [
              NotificationCard(
                title: S.of(context).notificationMockTitle1,
                subtitle: S.of(context).notificationMockSubtitle1,
              ),
              SizedBox(height: 16.h),
              NotificationCard(
                title: S.of(context).notificationMockTitle2,
                subtitle: S.of(context).notificationMockSubtitle2,
              ),
            ],
          );
        },
      ),
    );
  }
}
