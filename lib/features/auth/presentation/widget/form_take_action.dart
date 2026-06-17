import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/utils/consts/image_path.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/features/auth/presentation/widget/or_separator.dart';
import 'package:day_i/features/auth/presentation/widget/text_with_action.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FormTakeAction extends StatelessWidget {
  final String primaryButtonText;
  final VoidCallback onPrimaryPressed;
  final String? footerNormalText;
  final String? footerActionText;
  final VoidCallback? onFooterActionPressed;

  const FormTakeAction({
    super.key,
    required this.primaryButtonText,
    required this.onPrimaryPressed,
    this.footerNormalText,
    this.footerActionText,
    this.onFooterActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    final imagePath = getIt<ImagePath>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 24.h,
      children: [
        AppButton(text: primaryButtonText, onPressed: onPrimaryPressed),
        OrSeparator(),
        // google login button
        Directionality(
          textDirection: TextDirection.ltr,
          child: AppButton(
            text: S.current.login,
            isPrimary: false,
            icon: SvgPicture.asset(imagePath.google, height: 20.h, width: 20.w),
            border: BorderSide(color: theme.boarderPrimary, width: 1.w),
            onPressed: () {},
          ),
        ),
        TextWithAction(
          normalText: footerNormalText ?? S.current.dontHaveAccount,
          actionText: footerActionText ?? S.current.registerNow,
          onActionPressed:
              onFooterActionPressed ??
              () => context.navigateTo(RouterPath.signup),
        ),
      ],
    );
  }
}
