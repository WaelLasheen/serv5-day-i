import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/features/notification/presentation/widgets/notification_card.dart';
import 'package:day_i/generated/l10n.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      backgroundColor: appTheme.surfaceColor, // From Figma: background: #FFFFFF
      appBar: AppBar(
        backgroundColor: appTheme.surfaceColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).notifications,
          style: AppTextStyles.textXlSemiBold.copyWith(
            color: appTheme.textPrimary,
            fontFamily: 'Rubik',
            fontSize: 20.sp,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: appTheme.primaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(color: appTheme.boarderPrimary, height: 1.h),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        children: [
          const NotificationCard(
            title: 'جاهز تطوّر حملتك؟',
            subtitle: 'اقتراح خدمة مناسبة لنشاطك متاح دلوقتي.',
          ),
          SizedBox(height: 16.h),
          const NotificationCard(
            title: 'اختيار موفق',
            subtitle: 'الخدمة دي متوافقة تمامًا مع أهدافك التسويقية الحالية.',
          ),
          SizedBox(height: 16.h),
          const NotificationCard(
            title: 'إنجاز جديد',
            subtitle: 'تم الانتهاء من خدمة ضمن طلبك بنجاح.',
          ),
          SizedBox(height: 16.h),
          const NotificationCard(
            title: 'تم إضافة تحديث جديد على طلبك',
            subtitle: 'ادخل وشوف آخر المستجدات من فريق العمل.',
          ),
          SizedBox(height: 16.h),
          const NotificationCard(
            title: 'في انتظارك إجراء بسيط',
            subtitle: 'محتاجين موافقتك علشان نكمّل تنفيذ الطلب.',
          ),
          SizedBox(height: 16.h),
          const NotificationCard(
            title: 'جاهز تطوّر حملتك؟',
            subtitle: 'اقتراح خدمة مناسبة لنشاطك متاح دلوقتي.',
          ),
        ],
      ),
    );
  }
}
