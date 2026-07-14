import 'package:cached_network_image/cached_network_image.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
      content = CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) =>
            placeholder ?? _buildShimmerPlaceholder(context),
        errorWidget: (context, url, error) =>
            errorWidget ?? _buildErrorWidget(context),
      );
    } else {
      content = Image.asset(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) =>
            errorWidget ?? _buildErrorWidget(context),
      );
    }

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: content,
      );
    }

    return content;
  }

  Widget _buildShimmerPlaceholder(BuildContext context) {
    final appTheme = context.appTheme;
    return Shimmer.fromColors(
      baseColor: appTheme.grey500,
      highlightColor: appTheme.grey200,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? double.infinity,
        color: appTheme.surfaceColor,
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    final appTheme = context.appTheme;
    return Container(
      width: width,
      height: height,
      color: appTheme.grey200,
      child: const Center(
        child: Icon(
          Icons.broken_image,
          color: Colors.grey,
        ),
      ),
    );
  }
}
